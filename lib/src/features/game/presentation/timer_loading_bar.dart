import 'package:flutter/material.dart';
import '../../../state/timer_notifier.dart';

class TimerLoadingBar extends StatefulWidget {
  final int duration;

  TimerLoadingBar({required this.duration});

  @override
  _TimerLoadingBarState createState() => _TimerLoadingBarState();
}

class _TimerLoadingBarState extends State<TimerLoadingBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void resetTimer() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ).drive(Tween<double>(begin: 0.0, end: 1.0));

    _animation.addListener(() {
      setState(() {
        // gameNotifier.value.timerValue = _animation.value;
      });
    });

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        timerNotifier.restartTimer();
        resetTimer();
      }
    });

    timerNotifier.addListener(() {
      resetTimer();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    timerNotifier.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 193, 193, 193).withOpacity(0.2),
              borderRadius: BorderRadius.circular(15.0),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            width: MediaQuery.of(context).size.width * _animation.value,
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
          ),
        ],
      ),
    );
  }
}
