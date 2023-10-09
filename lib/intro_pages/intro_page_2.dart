import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),

            // Name of app

            Text(
              "",
              style: GoogleFonts.pridi(fontSize: 28,color: Colors.white),
            ),

                        // icon

            Expanded(
              flex: 5,
              child: Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset('lib/assets/images/github.png', height: 400,),
              ),
            ),

            Expanded(
              flex: 1,
              child: Text(
                "Free & OpenSource",
                style: GoogleFonts.pridi(fontSize: 40,color: Colors.white, height: 1),
              ),
            ),

            Expanded(
              flex: 3,
              child: Text(
                "Everyone can contribute on Github",
                style: GoogleFonts.pridi(fontSize: 20,color: Colors.grey[300]),
              ),
            ),

          ],
        )
      ),
    );
  }
}