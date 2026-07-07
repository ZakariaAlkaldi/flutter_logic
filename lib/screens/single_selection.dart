import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  List<Map> gifts = [
    {"name": "Duck", "image": "assets/animals/1.jpg"},
    {"name": "Tom", "image": "assets/animals/2.jpg"},
    {"name": "Bear", "image": "assets/animals/3.jpg"},
    {"name": "Picachu", "image": "assets/animals/4.jpg"},
    {"name": "Unknown", "image": "assets/animals/5.jpg"},
    {"name": "Jerry", "image": "assets/animals/6.jpg"},
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: gifts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 30,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        gifts[index]["image"],
                        fit: BoxFit.cover,
                        height: selectedIndex == index ? 110 : 100,
                        width: double.infinity,
                      ),
                      SizedBox(height: 3),
                      selectedIndex == index
                          ? SizedBox.shrink()
                          : Text(
                              gifts[index]["name"].toUpperCase(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                    ],
                  ),
                  selectedIndex == index
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                "Send",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
