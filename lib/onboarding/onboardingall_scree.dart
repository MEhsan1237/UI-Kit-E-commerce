import 'package:e_ui_comm_kit/screens/signIn.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  final List<SplashWidget> splashData = [
  SplashWidget(
      text: "TOKOTO",
      description: "Welcome to Tokoto, Let's shop!",
      imagePath: "assets/images/splash_1.png",
  ),
  SplashWidget(
      text: "TOKOTO",
      description: "We help people connect with store \n   around United State of America",
      imagePath: "assets/images/splash_2.png",
  ),
  SplashWidget(
      text: "TOKOTO",
      description: "We show the easy way to shop.\n    Just stay at home with us",
      imagePath: "assets/images/splash_3.png",
  )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: splashData.length,
                itemBuilder: (context, index) {
                  final data = splashData[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Text(
                          data.text,
                          style: TextStyle(
                            letterSpacing: 1.4,
                            color: Colors.deepOrangeAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          data.description,
                          style: TextStyle(

                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Image.asset(data.imagePath,height: 200,)
                      ],
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(controller: _controller, count: splashData.length,
            effect:  WormEffect(
              dotHeight:  10,
              dotWidth:  10,
              dotColor:  Colors.black26,
              activeDotColor:  Colors.deepOrangeAccent,
            ),
            ),
            SizedBox(height: 60,),
            Row(mainAxisAlignment:  MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                   style: TextButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),
                       onPressed: () {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                       },
                       child: Text("Skip",style: TextStyle(color: Colors.white,fontSize: 15),)),
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),
                    onPressed: (){
                     if (_controller.page!.round() == splashData.length-1){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                     }
                     else
                        {
                          _controller.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut
                          );
                        }

                    }, child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 15),))
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

class SplashWidget {
  final String text;
  final String description;
  final String imagePath;

  SplashWidget({
    required this.text,
    required this.description,
    required this.imagePath,
  });
}
