import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/images.dart';
import '../common/items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:<Widget> [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 15),
            sliver: SliverToBoxAdapter(
              child: Row(
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
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 13.h,)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            sliver: SliverToBoxAdapter(
              child: Container(
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
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 13.h,)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            sliver: SliverToBoxAdapter(
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade300,
                ),
                child: Image.network("https://m.media-amazon.com/images/G/31/img21/shoes/2023/Winterflip/MS/Stores/CML-5._CB574406998_.png",fit: BoxFit.cover,),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 13,)),
         SliverPadding(
           padding: EdgeInsets.symmetric(horizontal: 13),

           sliver: SliverToBoxAdapter(
             child: SizedBox(
               height: 80,
               child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context,index){
                     return Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 6),
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
               },itemCount: imageList.length,),
             ),
           ),
         ),
          SliverToBoxAdapter(child: SizedBox(height: 13,)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Special for you",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                  Text("See all",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey.withOpacity(.8),))
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 13.h,)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            sliver: SliverGrid.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
          ),
        ],
      ),
    );
  }
}
