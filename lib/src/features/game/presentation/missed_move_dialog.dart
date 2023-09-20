import 'package:flutter/material.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/cubit/timer_cubit.dart';
import 'cubit/game_cubit.dart';

class MissedMoveDialog extends StatefulWidget {
  final GameCubit gameCubit;
  final TimerCubit timerCubit;

  const MissedMoveDialog(
      {super.key, required this.gameCubit, required this.timerCubit});

  @override
  _MissedMoveDialogState createState() => _MissedMoveDialogState();
}

class _MissedMoveDialogState extends State<MissedMoveDialog>
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
        widget.timerCubit.resetTimer();
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
          alignment: Alignment.bottomCenter,
          backgroundColor:
              const Color(0xff001231), // Make the background transparent
          elevation: 0.0, // Remove the shadow behind the dialog content
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.warning_rounded,
                          color: Colors.white, size: 30.0), // The warning icon
                      SizedBox(height: 10.0),
                      Text(
                        "Opponent missed the move.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        "You are back to the normal flow.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      )
                    ],
                  )),
              Container(
                height: 5,
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
