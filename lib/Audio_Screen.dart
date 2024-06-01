import 'dart:io';

import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/session_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class AusioPage extends StatefulWidget {
  const AusioPage({super.key});

  @override
  State<AusioPage> createState() => _AusioPageState();
}

class _AusioPageState extends State<AusioPage> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  String _audioUrl1 = '';
  String _audioUrl2 = '';
  double _similarity = 0.0;
  final FFmpegKit _flutterFFmpeg = FFmpegKit();


  @override
  void initState() {
    super.initState();
    downloadAudioUrls(); // Call the download function in initState
  }

  Future<void> downloadAudioUrls() async {
    firebase_storage.ListResult result = await storage.ref('audios/').listAll();
    String url1 = '';
    String url2 = '';
    if (result.items.length >= 2) {
      url1 = await result.items[0].getDownloadURL();
      url2 = await result.items[1].getDownloadURL();
    }
    setState(() {
      _audioUrl1 = url1;
      _audioUrl2 = url2;
    });

    print("${_audioUrl1}");
    print("${_audioUrl2}");
    _compareAudios();

  }

  Future<void> uploadAudio(int audioNumber, BuildContext context) async {
    // Fetch audio URLs if they are not available
    // if (_audioUrl1.isEmpty || _audioUrl2.isEmpty) {
    //   await downloadAudioUrls();
    // }

    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      final file = result.files.first;
      final File localFile = File(file.path!);
      firebase_storage.Reference storageRef;

      // Ensure the selected file is an MP3
      if (file.name.toLowerCase().endsWith('.mp3')) {
        storageRef = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('audios/${file.name}');
        print("localFile======>${localFile}");
        firebase_storage.UploadTask uploadTask = storageRef.putFile(localFile);
        await uploadTask.whenComplete(() async {
          String downloadUrl = await storageRef.getDownloadURL();
          print("${downloadUrl}");
          setState(() {
            if (audioNumber == 1) {
              _audioUrl1 = downloadUrl;
              print("Uploaded audio URL 1: $_audioUrl1");
            } else {
              _audioUrl2 = downloadUrl;
              print("Uploaded audio URL 2: $_audioUrl2");
            }
            downloadAudioUrls();
          });
          _compareAudios();
        });
      } else {
        // Show a Snackbar when a non-MP3 file is selected
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select an MP3 audio file.'),
          ),
        );
      }
    }
  }


  // Future<void> uploadAudio(int audioNumber, BuildContext context) async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.audio,
  //   );
  //   if (result != null) {
  //     final file = result.files.first;
  //     final File localFile = File(file.path!);
  //     firebase_storage.Reference? storageRef;
  //
  //     // Ensure the selected file is an MP3
  //     if (file.name!.toLowerCase().endsWith('.mp3')) {
  //       storageRef = storage.ref('audios/${file.name}');
  //       UploadTask uploadTask = storageRef.putFile(localFile);
  //       TaskSnapshot snap = await uploadTask;
  //       String downloadUrl = await snap.ref.getDownloadURL();
  //       await uploadTask.whenComplete(() async {
  //         setState(() {
  //           if (audioNumber == 1) {
  //             _audioUrl1 = downloadUrl;
  //             print("nhygd ${_audioUrl1}");
  //           } else {
  //             _audioUrl2 = downloadUrl;
  //             print("nhygd ${_audioUrl2}");
  //           }
  //         });
  //       });
  //       _compareAudios();
  //     } else {
  //       // Show a Snackbar when a non-MP3 file is selected
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Please select an MP3 audio file.'),
  //         ),
  //       );
  //     }
  //   }
  // }

  Future<File> _downloadAndConvertAudio(String audioUrl) async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String fileName = Path.basename(audioUrl);
    final File file = File('${appDir.path}/$fileName');

    final response = await http.get(Uri.parse(audioUrl));
    await file.writeAsBytes(response.bodyBytes);

    final String outputPath = '${appDir.path}/${Path.basenameWithoutExtension(fileName)}.wav';
    var session = await FFmpegKit.executeAsync('-i ${file.path} $outputPath');

// Wait for the session to complete
//     await session.getFuture();

    var state = await session.getState();
    if (state == SessionState.completed) {
      var returnCode = await session.getReturnCode();
      if (returnCode != null && returnCode != 0) {
        var logs = await session.getAllLogs();
        var failStackTrace = await session.getFailStackTrace();
        print('FFmpeg conversion failed with result code $returnCode');
        print('Logs:');
        for (var log in logs) {
          print(log);
        }
        if (failStackTrace != null) {
          print('Stack trace: $failStackTrace');
        }
        throw Exception('FFmpeg conversion failed with result code $returnCode');
      } else {
        // Conversion succeeded
      }
    } else {
      // Handle other session states (e.g., failed, canceled, etc.)
    }
    return File(outputPath);
  }

  Future<void> _compareAudios() async {
    if (_audioUrl1.isEmpty || _audioUrl2.isEmpty) {
      return;
    }

    final File audioFile1 = await _downloadAndConvertAudio(_audioUrl1);
    final File audioFile2 = await _downloadAndConvertAudio(_audioUrl2);

    final int size1 = await audioFile1.length();
    final int size2 = await audioFile2.length();

    setState(() {
      _similarity = 1.0 - (size1 - size2).abs() / ((size1 + size2) / 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(
                Icons.arrow_back_sharp,
                color: Colors.white70,
              ),
            ),
          ),
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                color: const Color(0xFFD9D9D9),
                fontSize: 16,
              ),
              children: const [
                TextSpan(
                  text: 'Friday, ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: 'Jmd.II 16, 1445 AH',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                "assets/images/bell.svg",
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  uploadAudio(1,context);
                },
                child: Container(
                  height: 100,
                  width: 300,
                  decoration: BoxDecoration(
                      color: const Color(0xFF5130FC),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Upload Audio 1",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                          color: const Color(0xFFD9D9D9),
                          fontSize: 16,
                        ),
                      ),
                      // Text(
                      //   _audioUrl1 != null ? '${_audioUrl1}' : '',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w700,
                      //     fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                      //     color: const Color(0xFFD9D9D9),
                      //     fontSize: 16,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  uploadAudio(2,context);
                },
                child: Container(
                  height: 100,
                  width: 300,
                  decoration: BoxDecoration(
                      color: const Color(0xFF5130FC),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Upload Audio 2",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                          color: const Color(0xFFD9D9D9),
                          fontSize: 16,
                        ),
                      ),
                      // Text(
                      //   _audioUrl2 != null ? '${_audioUrl2}' : '',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w700,
                      //     fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                      //     color: const Color(0xFFD9D9D9),
                      //     fontSize: 16,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {},
              child: Text(
                "Compare Audios",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                  color: const Color(0xFFD9D9D9),
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _similarity.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                color: const Color(0xFFD9D9D9),
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
