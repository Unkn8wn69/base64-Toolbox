import 'package:base64_toolbox/home_page.dart';
import 'package:base64_toolbox/intro_pages/intro_page_1.dart';
import 'package:base64_toolbox/intro_pages/intro_page_2.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  // controller to keep track of what page

  final PageController _controller = PageController();

  // if on last page

  bool onLastPage = false;

  // button style

  TextStyle buttonStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasOnboardingBeenShown', true);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            controller: _controller,
            children: const [
              IntroPage1(),
              IntroPage2(),
          ]),
          Container(
            alignment: const Alignment(0,0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 300), 
                      curve: Curves.easeIn
                    )
                  },
                  child: Text("back", style: buttonStyle)
                ),

                SmoothPageIndicator(controller: _controller, count: 2, effect: const WormEffect(dotColor: Colors.white54, activeDotColor: Colors.deepPurple)),

                onLastPage ?
                GestureDetector(
                  onTap: () => {
                    _completeOnboarding(),
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    }))
                  },
                  child: Text("done",style: buttonStyle)
                ) : GestureDetector(
                  onTap: () => {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300), 
                      curve: Curves.easeIn
                    )
                  },
                  child: Text("next",style: buttonStyle)
                ),              
              ],
            )
          ),
        ],
      )
    );
  }
}