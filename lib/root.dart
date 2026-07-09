import 'package:flutter/material.dart';
import 'package:flutter_logic/screens/multi_image_select.dart';
import 'package:flutter_logic/screens/multi_selection.dart';
import 'package:flutter_logic/screens/single_selection.dart';
import 'package:flutter_logic/screens/toggle_selection.dart';
import 'package:flutter_logic/screens/upload_image.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  List<Widget> screens = [
    SingleSelection(),
    MultiImageSelect(),
    ToggleSelection(),
    MultiSelection(),
    UploadImage(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.jumpToPage(selectedIndex - 1);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                controller.jumpToPage(selectedIndex + 1);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                decoration: BoxDecoration(color: Colors.black),
                child: Row(
                  children: [
                    Text(
                      "Next Page",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 14),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
