import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopsy_app/common/images.dart';
import 'package:shopsy_app/common/items.dart';

import 'BottomNavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor:Colors.grey.shade300,
                  child: Icon(Icons.dashboard_rounded,color: Colors.black,),
                ),
                CircleAvatar(
                  backgroundColor:Colors.grey.shade300,
                  child: Icon(Icons.notifications_none,color: Colors.black,),
                )
              ],
            ),
            SizedBox(height: 13.h,),
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade300,

              ),
              child: Center(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                  )
                ),
              ),
            ),
            SizedBox(height: 13.h,),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade300,
              ),
              child: Image.network("https://m.media-amazon.com/images/G/31/img21/shoes/2023/Winterflip/MS/Stores/CML-5._CB574406998_.png",fit: BoxFit.cover,),
            ),
            SizedBox(height: 13,),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: imageList.length
                  ,itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25.h,
                        backgroundImage: NetworkImage("${imageList[index]["url"]}"),
                      ),
                      Text("${imageList[index]["name"]}")
                    ],
                  ),
                );
              },),
            ),
            SizedBox(height: 13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Special for you",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                Text("See all",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey.withOpacity(.8),))
              ],
            ),
            SizedBox(height: 13.h,),
            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

              ), itemBuilder: (context,index){
              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade400,
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 160,
                            width: 160,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Image.network("${items[index]["image"]}"),
                            )),
                        const SizedBox(height: 20,),
                        Column(
                          children: [
                            Text("${items[index]["name"]}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.currency_rupee),
                                      Text("${items[index]["price"]}"),
                                    ],
                                  ),
                                  SizedBox(width: 7,),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.black,
                                      ),
                                      const SizedBox(width: 2,),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.blue,
                                      ),
                                      const SizedBox(width: 2,),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.red,
                                      ),
                                      const SizedBox(width: 2,),
                                      CircleAvatar(
                                        radius: 10,
                                       backgroundColor: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
              );
              },itemCount: items.length,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.dashboard_customize_outlined),
          Icon(Iconsax.like),
          Icon(Iconsax.home),
          Icon(Icons.shopping_cart_sharp),
          Icon(Iconsax.profile)
        ],

      ),
    );
  }
}
