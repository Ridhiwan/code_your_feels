import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.deepOrange.shade100,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight/3,
            child: Container(
              color: Colors.deepOrange.shade700,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, ),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search_rounded, ),
                  onPressed: () {},
                )
              ],
              backgroundColor: Colors.deepOrange.shade700,
              elevation: 0.0,
            ),
          ),
          Positioned(
            top: screenHeight*0.2,
            left: 0,
            right: 0,
            height: screenHeight*0.38,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight*0.12,),
                  const Text("THE WATER CURE",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  const Text("Martin Hyatt",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: screenHeight*0.12,
              left: (screenWidth-150)/2,
              right: (screenWidth-150)/2,
              height: screenHeight*0.18,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  color: Colors.grey.withOpacity(0.8)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/happy/image6.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                  ),
                )

                ),
              )
        ],
      )
    );
  }
}
