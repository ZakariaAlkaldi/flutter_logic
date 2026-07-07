import 'package:flutter/material.dart';

class MultiImageSelect extends StatefulWidget {
  const MultiImageSelect({super.key});

  @override
  State<MultiImageSelect> createState() => _MultiImageSelectState();
}

class _MultiImageSelectState extends State<MultiImageSelect> {
  List<String> images = [
    "assets/animals/1.jpg",
    "assets/animals/2.jpg",
    "assets/animals/3.jpg",
    "assets/animals/4.jpg",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 203, 3),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.asset(images[selectedIndex]),
            ),

            SizedBox(height: 30),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: selectedIndex == index ? 3 : 1,
                          color: Colors.white,
                        ),
                      ),
                      child: Image.asset(images[index], fit: BoxFit.cover),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
