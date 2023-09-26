import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tick_toe_flutter/src/shared/presentation/button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 90,
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/titleBackground.jpg',
                      ),
                      const Text(
                        "TICK TOE",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          letterSpacing: 2,
                          fontFamily: 'TiltWarp',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Step into the World \n Where Every Move Counts!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: const Color(0xff001231),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Unleash Your Strategy in a Battle of\n X and O!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.nanumGothic().fontFamily,
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 50),
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: Button(
                      text: "GET STARTED",
                      onPressed: () => {
                        context.goNamed('select-mode'),
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
