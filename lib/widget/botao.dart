import 'package:epi/style/colors.dart';
import 'package:flutter/material.dart';

Widget customButton({
  VoidCallback? tap,
  bool? status = false,
  String? text,
  BuildContext? context,
}) {
  return Container(
    width: MediaQuery .of(context!).size.width,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: status == false ? tap : null,
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          padding: EdgeInsets.all(16.0)
        ),
        child: Text(
          status == false ? text! : 'Aguarde...',
          style: TextStyle(
            fontSize: 20.0,
            color: white
          ),
        ),
      ),
    )
  );
}