import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pt_prawathiyakarsapradipta/Screen/HomeScreen.dart';

import '../Model/OnBoardingModelList.dart';
import '../Style/Colors.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  int initialValue = 0;
  int progressIndex = 0;

  PageController? pageController;

  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
    pageController = PageController(initialPage: 0);
    progressIndex = 0;
  }

  double containerWidth() {
    return (150 / modal.length) * (progressIndex + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) => setState(() {
              initialValue = value;
              progressIndex = value;
              debugPrint("$value");
            }),
            children: modal.map((e) {
              return Stack(
                children: [
                  //Image
                  Image.network(
                    e.image.toString(),
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.35),
                    colorBlendMode: BlendMode.darken,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),

                  // DataEntry
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).viewPadding.top + 16),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 45,
                                    fontWeight: FontWeight.w800)),
                            SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0.0, right: 25.0),
                              child: Text(e.subtitle.toString(),
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w400)),
                            ),
                            SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }).toList(),
          ),
          //Determinate LinearProgressIndicator & FAB
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                    AnimatedContainer(
                      duration: 1.seconds,
                      width: containerWidth(),
                      height: 10,
                      decoration: BoxDecoration(
                        color: primaryColors,
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                  ],
                ),
                // Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColors,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 50,
                  width: 50,
                  child: InkWell(
                    onTap: () {
                      if (initialValue < 2) {
                        setState(
                            () => pageController?.jumpToPage(initialValue + 1));
                      } else {
                        Navigator.of(context).pushReplacement(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => InformationScreen()));
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
