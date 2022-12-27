import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pt_prawathiyakarsapradipta/Model/TodoModel.dart';
import 'package:pt_prawathiyakarsapradipta/Model/ProviderOperation.dart';
import 'package:pt_prawathiyakarsapradipta/Style/Colors.dart';

import '../Services/resources.dart';

class DetailScreen extends StatefulWidget {
  int id;
  String title;
  int userId;
  bool completed;

  DetailScreen(this.id, this.title, this.userId, this.completed);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    _userId = TextEditingController(text: widget.userId.toString());
    _id = TextEditingController(text: widget.id.toString());
    _title = TextEditingController(text: widget.title);

    super.initState();
  }

  void _showMessageInScaffold(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  TextEditingController _title = TextEditingController();
  TextEditingController _userId = TextEditingController();
  TextEditingController _id = TextEditingController();

  bool _isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ('updateScreen'),
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
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: _userId,
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ("userId").tr(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: _id,
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ('id').tr(),
                    ),
                  ),
                  SizedBox(
                    height: 200.00,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() => _isLoading = true);
                      String title = _title.text.toString();
                      int userId = int.parse(_userId.text.toString());
                      int id = int.parse(_id.text.toString());
                      Todo2 todos = Todo2(
                          id: id,
                          userId: userId,
                          title: title,
                          completed: true);

                      todos.id = widget.id;

                      Provider.of<ProviderOperation>(context, listen: false)
                          .updateTodos(todos)
                          .then((isSuccess) {
                        setState(() => _isLoading = false);
                        if (isSuccess) {
                          _showMessageInScaffold(("updateSuccess").tr());
                          Navigator.of(context).pop();
                        } else {
                          _showMessageInScaffold(("updateFailed").tr());
                        }
                      });
                    },
                    child: Container(
                      height: 50.0,
                      width: 150.0,
                      color: primaryColors,
                      child: Center(
                        child: Text(
                          ("update").tr(),
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
