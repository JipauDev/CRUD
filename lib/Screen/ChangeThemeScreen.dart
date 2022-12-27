import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

import '../Model/ProviderOperation.dart';

class ThemeChanger extends StatefulWidget {
  ThemeChanger({Key? key}) : super(key: key);

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ProviderOperation>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            ('themeChange').tr(),
            style: GoogleFonts.poppins(
                fontSize: 19.0, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            groupValue: themeChange.themeMode,
            value: ThemeMode.light,
            onChanged: themeChange.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            groupValue: themeChange.themeMode,
            value: ThemeMode.dark,
            onChanged: themeChange.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Mode'),
            groupValue: themeChange.themeMode,
            value: ThemeMode.system,
            onChanged: themeChange.setTheme,
          ),
        ],
      ),
    );
  }
}
