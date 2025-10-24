import 'package:flutter/material.dart';
//import '../model/book.dart';

class BookCover extends StatelessWidget{
  final String cover; 
  final double width;
  final double height;
  const BookCover({super.key, required this.cover,this.width = 100,this.height = 166.67,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width,
      height: height,
      child:Image.asset(cover, fit:BoxFit.cover,opacity: const AlwaysStoppedAnimation(1.0),),
    );
  }
}


