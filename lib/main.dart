import 'dart:ui';

import 'package:bright_infonet_task/food_model.dart';
import 'package:bright_infonet_task/main.dart';
import 'package:bright_infonet_task/tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<Food> foodList = [
  Food('lib/assets/break.png', 'Gobi', 'spice gobi noodle', 48, 4.71),
  Food('lib/assets/burger.jpeg', 'Burger', 'spice burger mix', 80, 7.53),
  Food('lib/assets/pasta.jpeg', 'Pasta ', 'spice pasta ix', 70, 6.55),
  Food('lib/assets/egg_pasta.jpeg', 'Egg Pasta', 'spice egg hot ', 60, 5.52),
  Food('lib/assets/tandoori1.jpg', 'Tandoori Chicken', 'spice tandoori chicken', 90, 8.51),
  Food('lib/assets/pizza.jpg', 'Pizza Classic ', 'spice tandoori chicken', 90, 4.50),
];
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        margin: const EdgeInsets.only(left: 16,right: 16,top: 32),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PreferredSize(
                preferredSize: Size(MediaQuery.sizeOf(context).width*-32, 70),
                child: AppBar(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30)
                  ),
                  leadingWidth: MediaQuery.sizeOf(context).width*0.3,
                  centerTitle: true,
                  leading:IconButton(
                    icon:const Icon( Icons.arrow_back_ios),
                    constraints: const BoxConstraints(
                        minWidth: 60,minHeight: 50
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.white70,
                    ),
                    onPressed: (){},
                  ),
                  title: Text("Search Food",
                    style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w700,fontSize: 16),),
                  actions:  [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('lib/assets/prof.png',height: 40,width:40,fit: BoxFit.cover,)),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width*0.1,
                    ),

                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.black12,
                            ),
                            child: TextFormField(
                              style: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.w500,),
                              keyboardType: TextInputType.text,
                              decoration:  InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Spice Food',
                                hintStyle: GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.w600,),
                                prefixIcon: const Icon(Icons.search, color: Colors.black,weight: 6,),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow.shade700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                              )
                            ),
                            iconSize: 28,
                            icon: const Icon(Icons.menu),
                            color: Colors.black,
                          ),
                        ],
                      ),
                      MasonryGridView.count(
                        itemCount: foodList.length+1,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        itemBuilder: (context, index) {
                          return Tile(
                            index: index,
                            extent: MediaQuery.sizeOf(context).height*0.3,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


