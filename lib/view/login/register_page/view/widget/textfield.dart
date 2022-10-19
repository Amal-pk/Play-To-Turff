import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/login/login_page/view_controller/login_controller.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.hint,
    required this.validator,
    required this.controller,
    required this.keybord,
    required this.icon,
    this.suffIcon,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType keybord;
  final String hint;
  final String validator;
  final Widget? suffIcon;
  final IconData icon;
  @override
  Widget build(BuildContext context) { 
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        suffixIcon: suffIcon,
      ),
      keyboardType: keybord,
    );
  }
}
