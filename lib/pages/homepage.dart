import 'package:daybyday/stages/happystage.dart';
import 'package:daybyday/stages/sadstage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title,textAlign: TextAlign.center)),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade300,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 450,
                  height: 100,
                  padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 7),
                  child: Center(
                    child: Text(
                        "How are you feeling right now?",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          color: const Color.fromRGBO(200, 100, 100, 1),
                          shadows: [
                            const Shadow(
                              color: Color.fromRGBO(10, 200, 150, 1),
                              blurRadius: 10.0,
                              offset: Offset(5.0, 5.0),
                            ),
                            Shadow(
                              color: Colors.yellow.shade300,
                              blurRadius: 5.0,
                              offset: const Offset(-5.0, 5.0),
                            ),
                          ],
                        )

                    ),)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HappyStage()
                          )
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.yellow.shade100,
                          boxShadow: [
                            const BoxShadow(
                                offset: Offset(10, 10),
                                color: Colors.black38,
                                blurRadius: 20),
                            BoxShadow(
                                offset: const Offset(-10, -10),
                                color: Colors.white.withOpacity(0.85),
                                blurRadius: 20)
                          ]),
                      child: Center(
                        child: Text(
                          'HAPPY!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              shadows: [
                                const Shadow(
                                    offset: Offset(3, 3),
                                    color: Colors.black38,
                                    blurRadius: 10),
                                Shadow(
                                    offset: const Offset(-3, -3),
                                    color: Colors.white.withOpacity(0.85),
                                    blurRadius: 10)
                              ],
                              color: Colors.yellow),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,width: 12,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SadStage()
                          )
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.brown.shade100,
                          boxShadow: [
                            const BoxShadow(
                                offset: Offset(10, 10),
                                color: Colors.black38,
                                blurRadius: 20),
                            BoxShadow(
                                offset: const Offset(-10, -10),
                                color: Colors.white.withOpacity(0.85),
                                blurRadius: 20)
                          ]),
                      child: Center(
                        child: Text(
                          'SAD:(',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              shadows: [
                                const Shadow(
                                    offset: Offset(3, 3),
                                    color: Colors.black38,
                                    blurRadius: 10),
                                Shadow(
                                    offset: const Offset(-3, -3),
                                    color: Colors.white.withOpacity(0.85),
                                    blurRadius: 10)
                              ],
                              color: Colors.brown),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Center(
                child: Text(
                    "An ASCII Art message for you :)",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: const Color.fromRGBO(200, 100, 100, 1),
                      shadows: [
                        const Shadow(
                          color: Color.fromRGBO(10, 200, 150, 1),
                          blurRadius: 10.0,
                          offset: Offset(5.0, 5.0),
                        ),
                        Shadow(
                          color: Colors.yellow.shade300,
                          blurRadius: 5.0,
                          offset: const Offset(-5.0, 5.0),
                        ),
                      ],
                    )

                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 500,
                width: 400,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.deepOrange,
                      offset: Offset(0.3, 0.3)
                    )
                  ]
                ),
                child: Image.asset("assets/images/feelings.png",
                fit: BoxFit.fill,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
