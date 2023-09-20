import 'package:flutter/material.dart';
import 'package:tick_toe_flutter/src/features/game/domain/game.enum.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/cubit/game_cubit.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/missed_move.dart';
import '../../../shared/presentation/loading_popup_w_content.dart';
import 'cubit/timer_cubit.dart';

class TimerLoadingBar extends StatefulWidget {
  final TimerCubit timerCubit;
  final GameCubit gameCubit;

  TimerLoadingBar({required this.timerCubit, required this.gameCubit});

  @override
  _TimerLoadingBarState createState() => _TimerLoadingBarState();
}

class _TimerLoadingBarState extends State<TimerLoadingBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void startTimer() {
    _controller.forward();
  }

  void timerCompleted() {}

  void resetTimer() {
    _controller.duration = Duration(
        seconds: widget.timerCubit.state.missedMoveDuration != 0
            ? widget.timerCubit.state.missedMoveDuration
            : widget.timerCubit.state.duration);
    _controller.reset();
    _controller.forward();
  }

  void pauseAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
  }

  void resumeAnimation() {
    if (!_controller.isAnimating) {
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.timerCubit.state.duration),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ).drive(Tween<double>(begin: 0.0, end: 1));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.timerCubit.timerCompleted();
      }
    });

    _controller.addListener(() {
      setState(() {});
    });

    widget.timerCubit.stream.listen((state) {
      if (state.status == TimerStatus.completed) {
        if (state.missedMoveDuration == 0) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const LoadingPopupWContent(
                  contentWidget: MissedMove(),
                );
              }).whenComplete(() => widget.timerCubit.resetTimer());
        } else {
          widget.timerCubit.resetTimer();
          widget.timerCubit.resetMissedMoveTime();
        }
      } else if (state.status == TimerStatus.restarted) {
        resetTimer();
      } else if (state.status == TimerStatus.paused) {
        pauseAnimation();
      } else if (state.status == TimerStatus.running) {
        resumeAnimation();
      } else if (state.status == TimerStatus.idle) {
        _controller.reset();
      }
    });

    widget.timerCubit.startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 193, 193, 193).withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.0),
              ),
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              width: constraints.maxWidth * _animation.value,
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
        );
      }),
    );
  }
}
