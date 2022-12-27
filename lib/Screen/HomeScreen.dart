import 'dart:async';

import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pt_prawathiyakarsapradipta/Screen/ChangeThemeScreen.dart';
import 'package:pt_prawathiyakarsapradipta/Style/Colors.dart';
import 'package:pt_prawathiyakarsapradipta/Widget/ShimmerCard.dart';
import 'package:pt_prawathiyakarsapradipta/Widget/UserList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:showcaseview/showcaseview.dart';

import '../Model/ProviderOperation.dart';
import 'UpdateScreen.dart';
import 'FormCreateScreen.dart';
import 'ChangeLanguageScreen.dart';

class InformationScreen extends StatefulWidget {
  InformationScreen({Key? key}) : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(builder: (context) => HomeScreen()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();

  bool loadData = true;

  @override
  void initState() {
    Timer(Duration(milliseconds: 3500), () {
      setState(() {
        loadData = false;
      });
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderOperation>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences preferences;

    displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool? showcaseVisibilityStatus = preferences.getBool("showShowcase");

      if (showcaseVisibilityStatus == null) {
        preferences.setBool("showShowcase", false).then((bool success) {
          if (success)
            print("Successfull in writing showshoexase");
          else
            print("some bloody problem occured");
        });

        return true;
      }

      return false;
    }

    displayShowcase().then((status) {
      if (status) {
        ShowCaseWidget.of(context).startShowCase([
          _one,
          _two,
          _three,
        ]);
      }
    });

    void _showMessageInScaffold(String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    return KeysToBeInherited(
      one: _one,
      two: _two,
      three: _three,
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          // backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              ('home').tr(),
              style: GoogleFonts.poppins(
                  // color: Colors.black,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
          actions: <Widget>[
            Showcase(
              key: _one,
              description: 'Click ini untuk mengubah theme',
              child: IconButton(
                  icon: Icon(
                    Icons.sunny,
                    // color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => ThemeChanger()));
                  }),
            ),
            Showcase(
              key: _three,
              description: 'Click ini untuk mengubah bahasa',
              child: IconButton(
                  icon: Icon(
                    Icons.language_rounded,
                    // color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => LanguageScreen()));
                  }),
            ),
            Showcase(
              key: _two,
              description: 'Click ini untuk membuat list',
              child: IconButton(
                  icon: Icon(
                    EvaIcons.plus,
                    // color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => FormAddScreen()));
                  }),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Consumer<ProviderOperation>(
            builder: (context, value, child) {
              // If the loading it true then it will show the circular progressbar
              if (value.isLoading) {
                return Column(
                  children: [
                    shimmerCard(),
                    shimmerCard(),
                    shimmerCard(),
                    shimmerCard(),
                    shimmerCard(),
                    shimmerCard(),
                    shimmerCard(),
                    shimmerCard(),
                    shimmerCard(),
                    shimmerCard(),
                  ],
                );

                // return const Center(
                //   child: CircularProgressIndicator(),
                // );
              }

              final todos = value.todos;
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 10.0, top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder: (_, __, ___) => DetailScreen(
                                    todo.id,
                                    todo.title,
                                    todo.userId,
                                    todo.completed)));
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Text(
                                  todo.id.toString(),
                                  style:
                                      GoogleFonts.sofia(color: Colors.yellow),
                                ),
                                backgroundColor: primaryColors,
                                radius: 25.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 250.0,
                                child: Text(
                                  todo.title,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: todo.completed
                                        ? Colors.green
                                        : primaryColors,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showAnimatedDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return ClassicGeneralDialogWidget(
                                  titleText: ('hapusData').tr(),
                                  contentText: ('jikaHapus').tr(),
                                  positiveTextStyle:
                                      TextStyle(color: primaryColors),
                                  onPositiveClick: () {
                                    Provider.of<ProviderOperation>(context,
                                            listen: false)
                                        .deleteTodos(todos[index].id)
                                        .then((isSuccess) {
                                      if (isSuccess) {
                                        _showMessageInScaffold(
                                            ('delete1').tr());
                                      } else {
                                        _showMessageInScaffold(
                                            ('delete2').tr());
                                      }
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  onNegativeClick: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                              animationType:
                                  DialogTransitionType.slideFromTopFade,
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(seconds: 1),
                            );
                          },
                          child: Icon(
                            Icons.delete,
                            size: 25.0,
                            color: Colors.redAccent.withOpacity(0.8),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class KeysToBeInherited extends InheritedWidget {
  final GlobalKey one;
  final GlobalKey two;
  final GlobalKey three;

  const KeysToBeInherited({
    super.key,
    required this.one,
    required this.two,
    required this.three,
    required Widget child,
  }) : super(child: child);

  static KeysToBeInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KeysToBeInherited>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
