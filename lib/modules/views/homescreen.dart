import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _progress = 0;
  late InAppWebViewController  inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: ()async{
        var isLastPage = await inAppWebViewController.canGoBack();
        if(isLastPage){
          inAppWebViewController.goBack();
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url:WebUri("buyandsellfood.uxdlabtech.com")
                ),
                onWebViewCreated: (InAppWebViewController controller){
                  inAppWebViewController = controller;
                },
                onProgressChanged: (InAppWebViewController controller , int progress){
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
              _progress < 1 ? Container(
                child: LinearProgressIndicator(
                  value: _progress,
                ),
              ):SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}