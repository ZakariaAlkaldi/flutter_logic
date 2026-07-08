import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSelection extends StatefulWidget {
  const ToggleSelection({super.key});

  @override
  State<ToggleSelection> createState() => _ToggleSelectionState();
}

class _ToggleSelectionState extends State<ToggleSelection> {
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),

            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage('assets/animals/ice.jpg'),
                ),
                Positioned(
                  bottom: -18,
                  right: 0,
                  left: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFollow = !isFollow;
                      });
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.pink,
                      child: Icon(
                        isFollow
                            ? CupertinoIcons.check_mark
                            : CupertinoIcons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 80),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isFollow ? CupertinoIcons.check_mark : CupertinoIcons.add,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Ice Bear",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
