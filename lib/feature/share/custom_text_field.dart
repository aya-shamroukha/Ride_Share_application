import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  CustomTextfield({
    super.key,
    this.validate,
    required this.labeltext,
    this.controller,
    this.suffixicon,
    this.isScreat = false,
  });

  final String labeltext;
  final TextEditingController? controller;
  final dynamic validate;
  final IconButton? suffixicon;
  final bool isScreat;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setstate) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: Theme.of(context).textTheme.displaySmall,
              //  keyboardType:textInputType ,
              validator: validate,
              obscureText: isScreat,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  errorBorder:
                      Theme.of(context).inputDecorationTheme.errorBorder,
                  focusedBorder:
                      Theme.of(context).inputDecorationTheme.focusedBorder,
                  enabledBorder:
                      Theme.of(context).inputDecorationTheme.enabledBorder,
                  hintText: labeltext,
                  suffixIcon: suffixicon),
            ),
          ),
        ],
      );
    });
  }
}
