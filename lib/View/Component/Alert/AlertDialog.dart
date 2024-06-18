import 'package:flutter/material.dart';

class ShowDialog {
  ShowDialog(
      {this.context,
      this.message,
      this.title,
      this.onPressedAccept,
      this.widget});

  BuildContext? context;
  String? message;
  String? title;
  Widget? widget;
  void Function()? onPressedAccept;

  void alert() {
    showDialog<String>(
      context: context!,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title!),
        content: Text(message!),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onPressedAccept,
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
  void done() {
    showDialog<String>(
      context: context!,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title!),
        content: const Icon(
          Icons.done_outline,
          color: Colors.green,
          size: 50,
        ),
      ),
    );
  }
}
