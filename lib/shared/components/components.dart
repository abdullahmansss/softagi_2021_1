import 'package:flutter/material.dart';

Widget defaultButton({
  @required Function whenPress,
  Color background = Colors.teal,
  @required String text,
  Color textColor = Colors.white,
  bool fullWidth = true,
  double width,
  bool upperCase = true,
}) =>
    Container(
      width: fullWidth ? double.infinity : width ?? null,
      child: MaterialButton(
        height: 40.0,
        onPressed: whenPress,
        color: background,
        child: Text(
          upperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required String label,
  @required IconData icon,
  @required Function onSubmit,
  @required Function onChange,
}) =>
    TextField(
      controller: controller,
      keyboardType: type,
      onSubmitted: onSubmit,
      onChanged: onChange,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(
          icon,
        ),
      ),
    );