import 'package:buyandsellfood/modules/widgets/PageViewWidget.dart';
import 'package:flutter/material.dart';
class PageScreen extends StatefulWidget {
  const PageScreen({super.key});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViewWidget(),
    );
    }
}