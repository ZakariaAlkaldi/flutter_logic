import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<String> types = [
    "News",
    "Sports",
    "Entertainment",
    "Technology",
    "Health",
    "Business",
    "LifeStyle",
    "Travel",
    "Food",
    "Education",
    "Science",
    "Fashion",
    "Music",
  ];

  Set<String> emptyType = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text(
              "What Do You Want To See On X?",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(height: 30),

            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: List.generate(types.length, (index) {
                final type = types[index];
                final isSelected = emptyType.contains(type);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        emptyType.remove(type);
                      } else {
                        emptyType.add(type);
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue.shade700
                              : Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          type,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),

                      isSelected
                          ? Positioned(
                              right: 15,
                              top: 8,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  CupertinoIcons.check_mark,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  size: 12,
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
