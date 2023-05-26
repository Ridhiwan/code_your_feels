import 'dart:convert';

import 'package:daybyday/custom_widgets/tabs.dart';
import 'package:daybyday/pages/audiopage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HappyStage extends StatefulWidget {
  const HappyStage({Key? key}) : super(key: key);

  @override
  State<HappyStage> createState() => _HappyStageState();
}

class _HappyStageState extends State<HappyStage> with SingleTickerProviderStateMixin{
  var _happy = [];
  late TabController controller;

  Future <void> readData() async {
    final String response = await rootBundle.loadString("json/happy.json");
    final dataList = await json.decode(response);
     setState(() {
       _happy = dataList;
     });
 }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange.shade600,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Popular Art",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 220,
                child: PageView.builder(
                  padEnds: false,
                  controller: PageController(viewportFraction: 0.8),
                  itemCount: _happy.length ,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                            image: AssetImage(_happy[index]["art"]),
                        )
                      ),
                    ),
                  );
                },),
              ),
              Expanded(
                  child: NestedScrollView(
                    controller: ScrollController(),
                    headerSliverBuilder: (context, bool isScroll) {
                      return [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: Colors.white70,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(40),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: TabBar(
                              indicatorPadding: const EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: const EdgeInsets.only(right: 10),
                              controller: controller,
                              isScrollable: true,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 7,
                                    offset: const Offset(0,0)
                                  )
                                ]
                              ),
                              tabs:  [
                                Tabs(
                                    color: Colors.yellowAccent.shade700,
                                    text: "New"
                                ),
                                Tabs(
                                    color: Colors.redAccent.shade700,
                                    text: "Popular"
                                ),
                                Tabs(
                                    color: Colors.blueAccent.shade700,
                                    text: "Trending"
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ];
                    }, body: TabBarView(
                    controller: controller,
                    children: [
                      ListView.builder(
                        itemCount: _happy.length,
                        itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AudioPage(
                                      jsonData: _happy,
                                      index: index,
                                    )
                                )
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white70,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    offset: const Offset(0,0),
                                    color: Colors.grey.withOpacity(0.2)
                                  ),
                                ]
                              ),
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(
                                 children: [
                                   Container(
                                     width: 90,
                                     height: 120,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       image: DecorationImage(
                                         image: AssetImage(_happy[index]["img"]),
                                         fit: BoxFit.fill
                                       )
                                     ),
                                   ),
                                   const SizedBox(width: 10,),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Row(
                                         children: [
                                           const Icon(
                                             Icons.star,
                                             size: 24,
                                             color: Color.fromRGBO(255, 153, 0, 1),
                                           ),
                                           const SizedBox(width: 5,),
                                           Text(_happy[index]["rating"],
                                               style: const TextStyle( color: Colors.deepOrange),
                                           ),
                                         ],
                                       ),
                                       Text(_happy[index]["title"],
                                       style: const TextStyle(
                                         fontSize: 15,
                                         fontWeight: FontWeight.bold
                                       ) ,
                                       ),
                                       Text(_happy[index]["text"],
                                       style: const TextStyle(
                                         fontSize: 12,
                                         color: Colors.blueGrey
                                       ) ,
                                       ),
                                     ],
                                   )
                                 ],
                               ),
                             ),
                            ),
                          ),
                        );
                      },),
                      ListView.builder(
                        itemCount: _happy.length,
                        itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  offset: const Offset(0,0),
                                  color: Colors.grey.withOpacity(0.2)
                                ),
                              ]
                            ),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               children: [
                                 Container(
                                   width: 90,
                                   height: 120,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     image: DecorationImage(
                                       image: AssetImage(_happy[index]["img"]),
                                       fit: BoxFit.fill
                                     )
                                   ),
                                 ),
                                 const SizedBox(width: 10,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       children: [
                                         const Icon(
                                           Icons.star,
                                           size: 24,
                                           color: Color.fromRGBO(255, 153, 0, 1),
                                         ),
                                         const SizedBox(width: 5,),
                                         Text(_happy[index]["rating"],
                                             style: const TextStyle( color: Colors.deepOrange),
                                         ),
                                       ],
                                     ),
                                     Text(_happy[index]["title"],
                                     style: const TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.bold
                                     ) ,
                                     ),
                                     Text(_happy[index]["text"],
                                     style: const TextStyle(
                                       fontSize: 12,
                                       color: Colors.blueGrey
                                     ) ,
                                     ),
                                   ],
                                 )
                               ],
                             ),
                           ),
                          ),
                        );
                      },),
                      ListView.builder(
                        itemCount: _happy.length,
                        itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  offset: const Offset(0,0),
                                  color: Colors.grey.withOpacity(0.2)
                                ),
                              ]
                            ),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               children: [
                                 Container(
                                   width: 90,
                                   height: 120,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     image: DecorationImage(
                                       image: AssetImage(_happy[index]["img"]),
                                       fit: BoxFit.fill
                                     )
                                   ),
                                 ),
                                 const SizedBox(width: 10,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       children: [
                                         const Icon(
                                           Icons.star,
                                           size: 24,
                                           color: Color.fromRGBO(255, 153, 0, 1),
                                         ),
                                         const SizedBox(width: 5,),
                                         Text(_happy[index]["rating"],
                                             style: const TextStyle( color: Colors.deepOrange),
                                         ),
                                       ],
                                     ),
                                     Text(_happy[index]["title"],
                                     style: const TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.bold
                                     ) ,
                                     ),
                                     Text(_happy[index]["text"],
                                     style: const TextStyle(
                                       fontSize: 12,
                                       color: Colors.blueGrey
                                     ) ,
                                     ),
                                   ],
                                 )
                               ],
                             ),
                           ),
                          ),
                        );
                      },),
                    ],
                  ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
