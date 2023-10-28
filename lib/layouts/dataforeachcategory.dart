import 'package:flutter/material.dart';
import 'package:newwspp/shared/shared_components.dart';

class categoryData extends StatelessWidget {
  final String cat;
  const categoryData({Key? key,required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          lastSilvernewslistview(
            categ: cat,
          ),
        ],
      ),
    );
  }
}
