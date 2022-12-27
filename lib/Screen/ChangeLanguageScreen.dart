import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageScreen extends StatefulWidget {
  LanguageScreen({Key? key}) : super(key: key);

  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ('language'),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18.5,
          ),
        ).tr(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text(('titleCard'),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "Gotik",
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600))
                                  .tr(),
                              content: Text(
                                ('descCard'),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Popins",
                                  fontWeight: FontWeight.w300,
                                ),
                              ).tr(),
                              actions: [
                                TextButton(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    context.setLocale(Locale('en', 'US'));
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ));
                  },
                  child: cardName(
                    flag: "https://thumbs2.imgbox.com/83/76/MhtndBd1_t.png",
                    title: ('english').tr(),
                  )),
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text(('titleCard').tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Gotik",
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600)),
                              content: Text(
                                ('descCard').tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Popins",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    context.setLocale(Locale('ar', 'DZ'));
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ));
                  },
                  child: cardName(
                    flag: "https://thumbs2.imgbox.com/83/f5/y4BZ7a3i_t.png",
                    title: ('arabic').tr(),
                  )),
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text(('titleCard').tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Gotik",
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600)),
                              content: Text(
                                ('descCard').tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Popins",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    context.setLocale(Locale('zh', 'CN'));
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 20.0),
                    child: Container(
                      height: 80.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                              color: Colors.black12,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                        child: Row(children: <Widget>[
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                spreadRadius: 10.0,
                                color: Colors.white,
                              )
                            ]),
                            child: Image.network(
                              "https://static.vecteezy.com/system/resources/previews/004/756/807/original/china-flag-free-vector.jpg",
                              height: 45.0,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              ('china').tr(),
                              style: TextStyle(
                                  fontFamily: "Popins",
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  letterSpacing: 1.3),
                            ),
                          )
                        ]),
                      ),
                    ),
                  )),
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text(('titleCard').tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Gotik",
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600)),
                              content: Text(
                                ('descCard').tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Popins",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    context.setLocale(Locale('id', 'ID'));
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 20.0),
                    child: Container(
                      height: 80.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                              color: Colors.black12,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                        child: Row(children: <Widget>[
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 10.0,
                                spreadRadius: 10.0,
                              )
                            ]),
                            child: Image.network(
                              "https://uxwing.com/wp-content/themes/uxwing/download/flags-landmarks/indonesia-flag-icon.png",
                              height: 45.0,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              ('indonesia').tr(),
                              style: TextStyle(
                                  fontFamily: "Popins",
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.3),
                            ),
                          )
                        ]),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class cardName extends StatelessWidget {
  String title, flag;
  cardName({required this.title, required this.flag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      child: Container(
        height: 80.0,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                spreadRadius: 0.0,
                color: Colors.black12,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 15.0),
          child: Row(children: <Widget>[
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  spreadRadius: 10.0,
                  color: Colors.white,
                )
              ]),
              child: Image.network(
                flag,
                height: 65.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: "Popins",
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.3),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
