import 'package:buyandsellfood/modules/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              PageContent(
                image: 'assets/image1.png',
                heading: 'Discover Local Delights',
                description:
                    'Explore a world of culinary wonders right in your neighborhood. From hidden gems to popular favorites, uncover the best flavors your city has to offer',
              ),
              PageContent(
                image: 'assets/image3.png',
                heading: 'Ordering Made Easy',
                description:
                    'Streamline your ordering process with our user-friendly platform. From browsing menus to checkout, enjoy a seamless and hassle-free experience from start to finish',
              ),
              PageContent(
                image: 'assets/image5.png',
                heading: 'Customize Your Food Experience',
                description:
                    'Tailor your dining journey to your taste buds whether it\'s dietary preferences or flavor cravings, personalize your food adventure with ease',
              ),
            ],
          ),
        ),
        SizedBox(height: 1.0),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PageIndicator(
                currentPage: _currentPage,
                pageCount: 3, // Number of pages
              ),
              SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (_currentPage != 2)
                    SizedBox(
                      width: 160, // Set the width to half of the screen width
                      height: 55.0,
                      child: ElevatedButton(
                        onPressed: () {
                          _pageController.jumpToPage(2);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                              side: BorderSide(
                                  color: Color(0xFF13B251)), // Add border
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFF13B251),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    width: (_currentPage < 2)
                        ? 160
                        : 345, // Set the width based on the current page
                    height: 55.0, // Set the height as desired
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.0),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF20CA62),
                            Color(0xFF13B251),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentPage < 2) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          } else {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()),
                                   (Route<dynamic> route) => false
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                              side: BorderSide(
                                  color: Colors
                                      .transparent), // No border for the button
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            (_currentPage < 2) ? 'Next' : 'Get started',
                            style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors
                                  .white, // Text color for both "Next" and "Get started"
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PageContent extends StatelessWidget {
  final String image;
  final String heading;
  final String description;

  PageContent(
      {required this.image, required this.heading, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 18 / 18, // Set the aspect ratio as per your requirement
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 30.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            heading,
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            description,
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  PageIndicator({required this.currentPage, required this.pageCount});

  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = [];

    for (int i = 0; i < pageCount; i++) {
      indicators.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: 12.0,
            height: 12.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (i == currentPage)
                  ? const Color(0xFF13B251)
                  : const Color.fromARGB(255, 235, 231, 231),
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }
}
