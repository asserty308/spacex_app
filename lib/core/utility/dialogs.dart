import 'package:flutter/material.dart';

/// Returns the text entered in the input field
Future<String> showInputDialog({BuildContext context, String title, String inputHint, String initialText = '', String withError = ''}) async {
  String inputText;

  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          autofocus: true,
          controller: TextEditingController(
            text: initialText,
          ),
          decoration: InputDecoration(
            hintText: inputHint,
            errorText: withError.isNotEmpty ? withError : null,
          ),
          onChanged: (value) {
            inputText = value;
          },
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop()
          ),
          FlatButton(
            child: const Text('OK'),
            onPressed: () { 
              // when 'OK' is pressed never return null - null indicates 'cancel'
              inputText ??= '';
              Navigator.of(context).pop(inputText); 
            }
          )
        ],
      );
    }
  );
}

void showOKDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(child: Text(content)),
        actions: <Widget>[
          FlatButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop()
          )
        ],
      );
    }
  );
}

void showTextSnackbar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
  scaffoldKey.currentState
    .showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
}

void showActionSnackbar(GlobalKey<ScaffoldState> scaffoldKey, String message, String actionLabel, Function onActionPressed) {
  scaffoldKey.currentState
    .showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: actionLabel,
          onPressed: onActionPressed,
        ),
      ),
    );
}