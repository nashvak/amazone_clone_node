import 'package:ecommerce_app/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: color == null ? GlobalVariables.secondaryColor : color,
      ),
      child: Text(
        text,
        style: TextStyle(
            color:
                color == null ? GlobalVariables.backgroundColor : Colors.black),
      ),
    );
  }
}
