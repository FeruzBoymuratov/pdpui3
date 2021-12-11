import 'package:flutter/material.dart';
import 'package:pdpui3/pages/home_page.dart';
import 'package:pdpui3/utils/Strings.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  static final String id = "intro";

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  late PageController _pageController;
  bool isVisible = false;
  int currentIndex = 0;

  void initState(){
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page){
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                image: "assets/images/cat.webp",
                title: Strings.stepOneT,
                content: Strings.stepOneC,
              ),

              makePage(
                image: "assets/images/QERKbkW.png",
                title: Strings.stepTwoT,
                content: Strings.stepTwoC,
              ),

              makePage(
                image: "assets/images/6-2-github-free-download-png-thumb.png",
                title: Strings.stepThreeT,
                content: Strings.stepThreeC,
              ),

            ],
          ),

          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),

          Visibility(
            visible: isVisible,
            child: Container(
              margin: EdgeInsets.only(bottom: 50, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _homeseeker(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, content}){
    return Container(
      
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 30,),
              Text(title, style: TextStyle(color: Colors.red, fontSize: 30),),
              SizedBox(height: 10,),
              Text(content, style: TextStyle(color: Colors.grey, fontSize: 18), textAlign: TextAlign.center,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          ),
        ],
      ),
      
    );
  }

  Widget _indicator(bool isActive){
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30:6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator(){
    List<Widget> indicators = [];

    for(int i= 0; i<3; i++){
      if(currentIndex == i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  Widget _homeseeker(){
        if(currentIndex == 2){
          setState(() {
            isVisible = true;
          });
          print(isVisible);
        }
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacementNamed(context, HomePage.id);
      },
      child: Text("Skip", style: TextStyle(color: Colors.red, fontSize: 17),),
    );
  }

}
