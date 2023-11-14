import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

class CustomCounter extends StatefulWidget {
  final bool counterBorder;
  final bool buttonBorder;
  final int? quantity;

  const CustomCounter(
      {super.key,
      this.quantity,
      required this.buttonBorder,
      required this.counterBorder});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print(widget.counterBorder);
    print(widget.buttonBorder);
    widget.quantity == null ? _counter = 0 : _counter = widget.quantity!;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.h, top: 1.h),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 5.h,
            width: 5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.w),
              border: widget.counterBorder == true
                  ? Border.all(color: kBorderColor, width: 1)
                  : null,
            ),
            child: IconButton(
              onPressed: _decrementCounter,
              icon: const Icon(FontAwesomeIcons.minus),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 6.h,
            width: 6.h,
            margin: EdgeInsets.symmetric(horizontal: 1.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.w),
              border: widget.buttonBorder == true
                  ? Border.all(color: kBorderColor, width: 1)
                  : null,
            ),
            child: Text(
              '$_counter',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 5.h,
            width: 5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.w),
              border: widget.counterBorder == true
                  ? Border.all(color: kBorderColor, width: 1)
                  : null,
            ),
            child: IconButton(
              onPressed: _incrementCounter,
              icon: const Icon(
                FontAwesomeIcons.plus,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
