import 'package:flutter/material.dart';
import 'loading_bar.dart';

class LoadingPopupWContent extends StatefulWidget {
  final Widget contentWidget;

  const LoadingPopupWContent({required this.contentWidget});

  @override
  _LoadingPopupWContentState createState() => _LoadingPopupWContentState();
}

class _LoadingPopupWContentState extends State<LoadingPopupWContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ).drive(
      Tween<double>(begin: 1.0, end: 0.0),
    );

    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The transparent white background
        Container(
          width: double.infinity,
          decoration:
              const BoxDecoration(color: Color.fromARGB(70, 255, 255, 255)),
        ),
        // The dialog box
        AlertDialog(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          backgroundColor:
              const Color(0xff001231), // Make the background transparent
          elevation: 0.0, // Remove the shadow behind the dialog content
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          content: LoadingBar(
            contentWidget: widget.contentWidget,
            animationValue: _animation.value,
          ),
        ),
      ],
    );
  }
}
