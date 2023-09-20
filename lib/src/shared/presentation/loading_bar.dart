import 'package:flutter/widgets.dart';

class LoadingBar extends StatefulWidget {
  final double animationValue;
  final Widget contentWidget;

  const LoadingBar(
      {super.key, required this.animationValue, required this.contentWidget});

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
          child: widget.contentWidget,
        ),
        Container(
          height: 5,
          width: MediaQuery.of(context).size.width * widget.animationValue,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF09FF9D),
                Color(0xFF09FFD6),
                Color(0xFF09DDFF),
              ],
              stops: [0.0, 0.5, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        )
      ],
    );
  }
}
