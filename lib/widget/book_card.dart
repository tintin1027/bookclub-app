import 'package:flutter/material.dart';
import 'book_cover.dart';
import '../model/book.dart'; 

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    /*
    const titleFontSize = 45.0;
    const titleLineHeight = 52.0;      
    const authorFontSize = 22.0;
    const authorLineHeight = 28.0;     
    const bodyFontSize = 14.0;
    const bodyLineHeight = 20.0;*/
    return Padding(padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCover(cover:book.cover, width:200 , height:333.3
          ),
          const SizedBox(height: 20),
          Text(book.title, style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,),
              ),
          const SizedBox(height: 20),   
          Text(book.author, style: const TextStyle(
              fontSize: 22,),
              ),
          const SizedBox(height: 20),   
          Text(book.descriptions, style: const TextStyle(
              fontSize: 14,),
              ),
        ],
      )
    );
  }
}