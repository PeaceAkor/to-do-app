import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
              print("$index, $onLastPage");
            });
          },
          children: [
            Container(
              color: const Color.fromARGB(255, 10, 17, 11),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'PULSE-UP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const Text(
                      'Discover a healthier stronger You.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Ariel',
                      ),
                    ),
                    const SizedBox(height: 50),
                    Image.asset('assets/exercise.avif'),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 10, 17, 11),
              child: Image.asset('assets/fitness.jpg'),
            ),
            Container(
              color: const Color.fromARGB(255, 10, 17, 11),
              child: Image.asset('assets/jumpbell.jpg'),
            )
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'tasks');
                },
                child: const Text(
                  'skip',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const SwapEffect(
                    dotColor: Colors.blue,
                    activeDotColor: Colors.white,
                    type: SwapType.yRotation),
              ),
              onLastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'tasks');
                      },
                      child: const Text(
                        'done',
                        style: TextStyle(color: Colors.grey),
                      ))
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child:
                          const Icon(Icons.arrow_forward, color: Colors.grey),
                    )
            ],
          ),
        )
      ],
    ));
  }
}
