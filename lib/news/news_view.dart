import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
const NewsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Text(
      'Vista de noticias',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}