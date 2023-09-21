import 'package:flutter/material.dart';
import 'package:tick_toe_flutter/src/shared/domain/button_variations.dart';

class Button extends StatelessWidget {
  final String text;
  final Variant? variant;
  final void Function()? onPressed;

  const Button(
      {super.key,
      required this.text,
      this.variant = Variant.primary,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        gradient: LinearGradient(
          colors: variationsColors[variant]!,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, elevation: 0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 6.0,
                color: Colors.black.withOpacity(0.16),
                offset: const Offset(0, 3.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
