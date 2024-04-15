import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri("http://buyandsellfood.uxdlabtech.com"),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                inAppWebViewController = controller;
              },
              onProgressChanged: (InAppWebViewController controller, int progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
            ),
            _progress < 1
                ? Container(
                    child: LinearProgressIndicator(
                      value: _progress,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _setupBackButtonListener(context);
  // }

//  void _setupBackButtonListener(BuildContext context) {
//   inAppWebViewController.backButtonPressed.listen((_) {
//     _handleBackButton(context);
//   });
// }

//   Future<void> _handleBackButton(BuildContext context) async {
//     if (await inAppWebViewController.canGoBack()) {
//       inAppWebViewController.goBack();
//     } else {
//       // If web view can't go back, do nothing
//     }
//   }
// }
}