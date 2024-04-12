import 'package:flutter/material.dart';

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
          flex: 3,
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
                description: 'Explore a world of culinary wonders right in your neighborhood. From hidden gems to popular favorites, uncover the best flavors your city has to offer',
              ),
              PageContent(
                image: 'assets/image3.png',
                heading: 'Ordering Made Easy',
                description: 'Streamline your ordering process with our user-friendly platform. From browsing menus to checkout, enjoy a seamless and hassle-free experience from start to finish',
              ),
              PageContent(
                image: 'assets/image5.png',
                heading: 'Customize Your Food Experience',
                description: 'Tailor your dining journey to your taste buds whether it\'s dietary preferences or flavor cravings, personalize your food adventure with ease',
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: PageIndicator(
              currentPage: _currentPage,
              pageCount: 3, // Number of pages
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Visibility(
              visible: _currentPage != 0, // Show "Skip" button if not on the first page
              child: Container(
                width: MediaQuery.of(context).size.width / 2, // Set button width to half of the screen width
                child: TextButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Text('Skip'),
                ),
              ),
            ),
            Visibility(
              visible: _currentPage != 2, // Show "Next" button if not on the last page
              child: Container(
                width: MediaQuery.of(context).size.width / 2, // Set button width to half of the screen width
                child: TextButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Text('Next'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class PageContent extends StatelessWidget {
  final String image;
  final String heading;
  final String description;

  PageContent({required this.image, required this.heading, required this.description});

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
              fontSize: 16.0,
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
              color: (i == currentPage) ? const Color.fromARGB(255, 58, 243, 33) : const Color.fromARGB(255, 235, 231, 231),
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
