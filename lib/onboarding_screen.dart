import 'package:base64_toolbox/home_page.dart';
import 'package:base64_toolbox/intro_pages/intro_page_1.dart';
import 'package:base64_toolbox/intro_pages/intro_page_2.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  // controller to keep track of what page

  PageController _controller = PageController();

  // if on last page

  bool onLastPage = false;

  // button style

  TextStyle buttonStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

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
            children: [
              IntroPage1(),
              IntroPage2(),
          ]),
          Container(
            alignment: Alignment(0,0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 300), 
                      curve: Curves.easeIn
                    )
                  },
                  child: Text("back", style: buttonStyle)
                ),

                SmoothPageIndicator(controller: _controller, count: 2, effect: WormEffect(dotColor: Colors.white54, activeDotColor: Colors.deepPurple)),

                onLastPage ?
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }))
                  },
                  child: Text("done",style: buttonStyle)
                ) : GestureDetector(
                  onTap: () => {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 300), 
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