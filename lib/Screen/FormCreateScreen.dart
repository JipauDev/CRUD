import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pt_prawathiyakarsapradipta/Model/TodoModel.dart';
import 'package:pt_prawathiyakarsapradipta/Model/ProviderOperation.dart';
import 'package:pt_prawathiyakarsapradipta/Screen/HomeScreen.dart';

import '../Services/resources.dart';
import '../Style/Colors.dart';

class FormAddScreen extends StatefulWidget {
  FormAddScreen();

  @override
  State<FormAddScreen> createState() => _FormAddScreenState();
}

class _FormAddScreenState extends State<FormAddScreen> {
  void _showMessageInScaffold(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  TextEditingController _title = TextEditingController();
  TextEditingController _userId = TextEditingController();
  TextEditingController _id = TextEditingController();

  bool _isFieldTitleValid = false;
  bool _isFieldUseridValid = false;
  bool _isFieldIDValid = false;

  bool _isLoading = false;

  void submit(BuildContext context) {
    if (_isFieldTitleValid == null ||
        _isFieldUseridValid == null ||
        _isFieldIDValid == null ||
        !_isFieldTitleValid ||
        !_isFieldUseridValid ||
        !_isFieldIDValid) {
      _showMessageInScaffold(('tolongIsi').tr());
      return;
    }

    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      String title = _title.text.toString();
      int userId = int.parse(_userId.text.toString());
      int id = int.parse(_id.text.toString());
      Todo2 todos =
          Todo2(id: id, userId: userId, title: title, completed: true);
      Provider.of<ProviderOperation>(context, listen: false)
          .createTodos(todos)
          .then((res) {
        if (res) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
        } else {
          var snackbar = SnackBar(
            content: Text(('ops').tr()),
          );
          _showMessageInScaffold("Success");
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ('FormAddScreen').tr(),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18.5,
          ),
        ).tr(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _title,
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ('title').tr(),
                      errorText:
                          _isFieldTitleValid == null || _isFieldTitleValid
                              ? null
                              : ('titleRequired').tr(),
                    ),
                    onChanged: (value) {
                      bool isFieldValid = value.trim().isNotEmpty;
                      if (isFieldValid != _isFieldTitleValid) {
                        setState(() => _isFieldTitleValid = isFieldValid);
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: _userId,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ('userID').tr(),
                      errorText:
                          _isFieldUseridValid == null || _isFieldUseridValid
                              ? null
                              : ('userID2').tr(),
                    ),
                    onChanged: (value) {
                      bool isFieldValid = value.trim().isNotEmpty;
                      if (isFieldValid != _isFieldUseridValid) {
                        setState(() => _isFieldUseridValid = isFieldValid);
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: _id,
                    obscureText: false,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ('ID').tr(),
                      errorText: _isFieldIDValid == null || _isFieldIDValid
                          ? null
                          : ('id2').tr(),
                    ),
                    onChanged: (value) {
                      bool isFieldValid = value.trim().isNotEmpty;
                      if (isFieldValid != _isFieldIDValid) {
                        setState(() => _isFieldIDValid = isFieldValid);
                      }
                    },
                  ),
                  SizedBox(
                    height: 200.00,
                  ),
                  InkWell(
                    onTap: () {
                      submit(context);
                    },
                    child: Container(
                      height: 50.0,
                      width: 150.0,
                      color: primaryColors,
                      child: Center(
                        child: Text(
                          ('addData').tr(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
