import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newwspp/Services/News_Services.dart';
import 'package:newwspp/layouts/dataforeachcategory.dart';
import 'package:newwspp/models/article_model.dart';
import 'package:newwspp/models/listviewmodel.dart';

class card extends StatelessWidget {
  const card({super.key, required this.category});

  final cardd category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return categoryData(cat:category.Name ,);
        },),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16,left: 5),
        child: Container(
          height: 85,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage(category.image), fit: BoxFit.fill),
          ),
          child: Center(
            child: Text(
              category.Name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}


class listv extends StatelessWidget {
   listv({super.key,});

  final List<cardd> categories=[
    cardd(image: "assests/one.jpg", Name: "General"),
    cardd(image: "assests/business.jpg", Name: "Business"),
    cardd(image: "assests/entertainment.jpg", Name: "Entertainment"),
    cardd(image: "assests/science.jpg", Name: "Science"),
    cardd(image: "assests/health.jpg", Name: "Health"),
    cardd(image: "assests/sports.jpg", Name: "Sports"),
    cardd(image: "assests/technology.jpeg", Name: "Technology"),

  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return card(
              category: categories[index],
            );
          }),
    );
  }
}
//*************************************
class newsposts extends StatelessWidget {
  const newsposts({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(6),
          child:   Image.network(
            articleModel.image??"",
            height: 200,width: double.infinity,
          fit: BoxFit.cover,),

        ),
        Column(
          children: [
            SizedBox(height: 12,),
            Text(
              "${articleModel.title}",
               overflow: TextOverflow.ellipsis,
              style: TextStyle(color: CupertinoColors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text("${articleModel.subtitle ?? " "}",maxLines: 2,
              style: TextStyle(color:Colors.grey,fontSize: 15,),),


          ],
        ),
      ],
    );
  }
}

//****************************

class Slivernewsposts extends StatelessWidget {

   List<ArticleModel> srticles=[];
   Slivernewsposts({super.key,required this.srticles});
  @override
  Widget build(BuildContext context) {

    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: srticles.length,
          (context, index) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: newsposts(
          articleModel: srticles[index],
        ),
      );

    },));
  }
}
//*************************

class lastSilvernewslistview extends StatefulWidget {
  final String categ;
  const lastSilvernewslistview({
    super.key,
   required this.categ
  });

  @override
  State<lastSilvernewslistview> createState() => _lastSilvernewslistviewState();
}
class _lastSilvernewslistviewState extends State<lastSilvernewslistview> {
 // bool isloaded=true;

  // Future<void> getHHtp()async{
  //   srticles=
  //   isloaded=false;
  //   setState(() {});
  //
  // }
  var future;
  void initState() {
    // TODO: implement initState
    super.initState();
   future= NewsService(Dio()).getHttp(category: widget.categ);
  }
  Widget build(BuildContext context) {

    return FutureBuilder <List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
    if (snapshot.hasData) {
    return Slivernewsposts(srticles: snapshot.data!,);
    }
    else if(snapshot.hasError) {
      return const SliverToBoxAdapter(
        child: Text("OOPS! there is an error"),
      );
    }
    else{
      return SliverToBoxAdapter(
              child: Center(
                  child: CircularProgressIndicator()));
    }
        },);


    // return isloaded? SliverToBoxAdapter(
    //     child: Center(
    //         child: CircularProgressIndicator()))
    //     : srticles.isEmpty? Slivernewsposts(srticles: srticles,)
    //     : SliverToBoxAdapter(child: Text("OOPS! there is an error"),);
  }
}
