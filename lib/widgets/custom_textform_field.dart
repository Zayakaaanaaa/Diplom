import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../util/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool icon;
  final TextEditingController controller;
  final bool? inputType;
  // final bool? valid;
  bool obScure;

  CustomTextFormField({
    // required this.valid,
    super.key,
    required this.hintText,
    required this.icon,
    this.inputType,
    required this.label,
    required this.controller,
    required this.obScure,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(
            widget.label,
            style: kRegular12,
          ),
        ),
        SizedBox(
          height: 0.8.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
              color: kScaffoldColor,
              border:
                  Border.all(width: 0.5.sp, color: kInputDecorationBorderColor),
              borderRadius: BorderRadius.circular(10.w),
              boxShadow: kBoxShadow),
          child: TextFormField(
            controller: widget.controller,
            keyboardType:
                widget.inputType == true ? TextInputType.emailAddress : null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: kInputDecorationHintStyle,
              suffixIcon: widget.icon == true
                  ? IconButton(
                      icon: widget.obScure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          widget.obScure = !widget.obScure;
                        });
                      },
                    )
                  : null,
            ),
            obscureText: widget.obScure == true ? true : false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              value != null && !EmailValidator.validate(value)
                  ? 'Enter a valid email'
                  : null;

              // value != null && value.length < 8
              //     ? 'Enter min. 8 characters'
              //     : null;
            },
          ),
        ),
      ],
    );
  }
}
