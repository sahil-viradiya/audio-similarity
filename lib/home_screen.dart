
import 'package:audio_similirity/Audio_Screen.dart';
import 'package:audio_similirity/utils/GradientContainer.dart';
import 'package:audio_similirity/utils/const.dart';
import 'package:audio_similirity/utils/dailog_custom_box.dart';
import 'package:audio_similirity/utils/gradientText_Custom.dart';
import 'package:audio_similirity/utils/text_view_cunstom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  firebase_storage.FirebaseStorage storage= firebase_storage.FirebaseStorage.instance;

  bool isToggled = false;

  void _toggleButton() {
    setState(() {
      isToggled = !isToggled;
    });

    if (isToggled) {
      _showDialog();
    }
  }

  void _showDialog() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFECCAFF), Color(0xFFA5ADFF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(2, 2),
                    blurRadius: 6.0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(2, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Browse Apps",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                          color: const Color(0xFF5130FC))),
                  1.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomContainer(
                          svgPath: "assets/images/tajmahel.svg",
                          text: "Solat Time & Qiblah Direction"),
                      CustomContainer(
                          svgPath: "assets/images/second.svg",
                          text: "Quran Reader"),
                      CustomContainer(
                          svgPath: "assets/images/third.svg", text: "E-Hadith"),
                    ],
                  ),
                  1.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomContainer(
                          svgPath: "assets/images/fourth.svg",
                          text: "E-Tarteel"),
                      CustomContainer(
                          svgPath: "assets/images/five.svg",
                          text: "Online Tafsir"),
                      CustomContainer(
                          svgPath: "assets/images/six.svg",
                          text: "Hajj Umrah Guide"),
                    ],
                  ),
                  1.ph,
                  CustomContainer(
                      svgPath: "assets/images/seven.svg",
                      text: "Halal Food Search"),
                  1.ph,
                  Text("My Tasks",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                          color: const Color(0xFF5130FC))),
                  1.ph,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Irkaz Daily",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                              color: const Color(0xFF5130FC))),
                      SvgPicture.asset("assets/images/chevronright.svg")
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    color: Color(0xFF5130FC),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Solat Check",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                              color: const Color(0xFF5130FC))),
                      SvgPicture.asset("assets/images/chevronright.svg")
                    ],
                  ),
                  const Divider(
                    thickness: 0.3,
                    color: Color(0xFF5130FC),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("My Profile",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                              color: const Color(0xFF5130FC))),
                      SvgPicture.asset("assets/images/chevronright.svg")
                    ],
                  ),
                  1.ph
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              "assets/images/menu.svg",
              width: 30,
              height: 30,
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
        bottomNavigationBar:
        Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                width: 320,
                height: 85,
                margin: const EdgeInsets.only(right: 15, bottom: 10, left: 15),
                padding: const EdgeInsets.only(right: 20, left: 20),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bottombarimage.png"),
                        fit: BoxFit.contain)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/home.svg",
                              height: 27,
                              width: 27,
                            ),
                            Text("Home",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                    color: const Color(0xFF6D6D6D))),
                          ],
                        ),
                        2.pw,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/Quran.svg",
                              height: 27,
                              width: 27,
                            ),
                            Text("Quran",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                    color: const Color(0xFF6D6D6D))),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 89,
                      width: 89,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/Qibla.svg",
                              height: 27,
                              width: 27,
                            ),
                            Text("Qibla",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                    color: const Color(0xFF6D6D6D))),
                          ],
                        ),
                        2.pw,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/user.svg",
                              height: 27,
                              width: 27,
                            ),
                            Text("Profile",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                    color: const Color(0xFF6D6D6D))),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 25,
                child: InkWell(
                  onTap: _toggleButton,
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: isToggled
                            ? [const Color(0xFFECCAFF), const Color(0xFFA5ADFF)]
                            : [const Color(0xFFC750FF), const Color(0xFF14008E)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.4),
                          offset: const Offset(3, 3),
                          blurRadius: 6.0,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.4),
                          offset: const Offset(-3, 3),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: isToggled
                        ? SvgPicture.asset("assets/images/ArrowDown.svg")
                        : SvgPicture.asset("assets/images/centericon.svg"),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, top: 5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Image(
                          image: AssetImage("assets/images/profileimage.png"),
                          height: 60,
                          width: 60,
                        ),
                        2.pw,
                        Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GradientText(
                                  text: 'Assalamualaikum',
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFECCAFF),
                                      Color(0xFFA5ADFF)
                                    ], // Adjust gradient colors
                                  ),
                                  fontSize: 23,
                                  fontWeight: FontWeight.w300,
                                ),
                                GradientText(
                                  text: 'Mujtaba!',
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFECCAFF),
                                      Color(0xFFA5ADFF)
                                    ], // Adjust gradient colors
                                  ),
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    2.ph,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GradientContainer(
                            width: 160,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/mappin.svg",
                                ),
                                1.pw,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Mumbai,',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: GoogleFonts.ibmPlexSans()
                                            .fontFamily,
                                        color: const Color(0xFF141414),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Maharashtra',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: GoogleFonts.ibmPlexSans()
                                            .fontFamily,
                                        color: const Color(0xFF141414),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                        GradientContainer(
                            width: 160,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/watch.svg",
                                ),
                                0.5.pw,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Check',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: GoogleFonts.ibmPlexSans()
                                            .fontFamily,
                                        color: const Color(0xFF141414),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'World Time',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: GoogleFonts.ibmPlexSans()
                                            .fontFamily,
                                        color: const Color(0xFF141414),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                2.pw,
                                SvgPicture.asset(
                                  "assets/images/arrow_circle.svg",
                                ),
                              ],
                            )),
                      ],
                    ),
                    2.5.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GradientContainer(
                            width: 160,
                            height: 165,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                1.ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/zumer.svg",
                                    ),
                                    0.5.pw,
                                    Text(
                                      'Next Prayer',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: GoogleFonts.ibmPlexSans()
                                            .fontFamily,
                                        color: const Color(0xFF141414),
                                        fontSize: 12,
                                      ),
                                    ),
                                    0.5.pw,
                                    SvgPicture.asset(
                                      "assets/images/zumer.svg",
                                    ),
                                  ],
                                ),
                                Text(
                                  'Zuhr',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                    color: const Color(0xFF141414),
                                    fontSize: 28,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontFamily:
                                      GoogleFonts.ibmPlexSans().fontFamily,
                                      color: const Color(0xFF141414),
                                      fontSize: 22,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: '12:30',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      TextSpan(
                                        text: 'AM',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Next Prayer in\n 1 hr(s) 29 min(s) 54 s',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                    color: const Color(0xFF141414),
                                    fontSize: 12,
                                  ),
                                ),
                                1.ph,
                              ],
                            )),
                        GradientContainer(
                            width: 160,
                            height: 165,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                1.ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/zumer.svg",
                                    ),
                                    0.5.pw,
                                    Text(
                                      'Today',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: GoogleFonts.ibmPlexSans()
                                            .fontFamily,
                                        color: const Color(0xFF141414),
                                        fontSize: 12,
                                      ),
                                    ),
                                    0.5.pw,
                                    SvgPicture.asset(
                                      "assets/images/zumer.svg",
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomRichText(
                                              text: "Fajr",
                                              firstText: "04:15",
                                              secondText: "AM"),
                                          0.4.ph,
                                          const Divider(
                                            height: 0.0001,
                                            color: Color(0xFF7F7A7D),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                0.5.ph,
                              ],
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child:
                      SvgPicture.asset("assets/images/horizontolline.svg"),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    1.pw,
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AusioPage(),));
                          },
                          child: Container(
                            height: 102,
                            width: 75,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFA36FE),
                                  Color(0xFF006096),
                                  Color(0xFF23002F),
                                  Color(0xFF0F002F)
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: const Offset(2, 2),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/zumerwhite.svg",
                                  height: 15,
                                  width: 15,
                                ),
                                Text(
                                  "Irkaz\nDaily",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                    color: const Color(0xFFD9D9D9),
                                    fontSize: 13,
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/images/zumerwhite.svg",
                                  height: 15,
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        0.5.ph,
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/checkcircle.svg"),
                            1.pw,
                            Text(
                              "Read",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily:
                                GoogleFonts.ibmPlexSans().fontFamily,
                                color: const Color(0xFFD9D9D9),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "1 of 3",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                            color: const Color(0xFFD9D9D9),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    2.pw,
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 140,
                            width: 160,
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFECCAFF),
                                  Color(0xFFA5ADFF),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: const Offset(2, 2),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                0.5.ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/zumerpurpule.svg",
                                      width: 15,
                                      height: 15,
                                    ),
                                    0.5.pw,
                                    Text(
                                      'Hadith of the Day',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: GoogleFonts.ibmPlexSans()
                                            .fontFamily,
                                        color: const Color(0xFF8E0090),
                                        fontSize: 12,
                                      ),
                                    ),
                                    0.5.pw,
                                    SvgPicture.asset(
                                      "assets/images/zumerpurpule.svg",
                                      width: 15,
                                      height: 15,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Sunan Abu Dawood',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                    color: const Color(0xFF220022),
                                    fontSize: 9,
                                  ),
                                ),
                                Text(
                                  '41, 4664',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                    color: const Color(0xFF220022),
                                    fontSize: 9,
                                  ),
                                ),
                                2.ph,
                                Text(
                                  'Narrated Abu Umamah: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                    color: const Color(0xFF8E0090),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  'The Prophet (ﷺ) said: If anyone loves for ...',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                    GoogleFonts.ibmPlexSans().fontFamily,
                                    color: const Color(0xFF210022),
                                    fontSize: 12,
                                  ),
                                ),
                                0.5.ph,
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 15, bottom: 15, top: 15),
                child: SvgPicture.asset("assets/images/horizontolline.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}