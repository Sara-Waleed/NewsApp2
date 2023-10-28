
import 'package:flutter/material.dart';
import 'package:newwspp/shared/shared_components.dart';

class home extends StatelessWidget {
   home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("News",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Text("cloud",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        body:CustomScrollView(
          slivers: [
            SliverToBoxAdapter(  child:listv(),),
            SliverToBoxAdapter(child: SizedBox(height: 10,)),
            lastSilvernewslistview(
              categ: "",
            ),
          ],
        ),

      ),
    );
  }
}
