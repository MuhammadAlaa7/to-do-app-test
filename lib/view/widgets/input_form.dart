import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint ; 
  final Icon icon ; 
  final Text label ; 
  final bool isReadOnly ; 
  final TextEditingController? controller;
  void Function()? onTap ; 
  InputField({
    required this.hint , 
    required this.icon, 
    required this.label, 
    required this.isReadOnly, 
     this.controller,
    this.onTap, 
  }); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
          readOnly: isReadOnly ? true : false ,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon:icon , 
          label: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), 
            
          ),
        ),
      ),
    ); 
  }
}