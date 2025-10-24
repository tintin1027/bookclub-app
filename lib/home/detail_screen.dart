import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/book.dart';
import '../widget/book_card.dart';
import '../widget/book_cover.dart';
import 'home_cubit.dart';

class DetailScreen extends StatelessWidget{
  final Book book;
  const DetailScreen ({super.key, required this.book});
  /*
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xFFFEF7FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.read<HomeCubit>().backToList(),
        ),
        title: const Text(
          'Book List',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // <-- centers the title
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20), 
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookCard(book: book),
          ],
        ),
      ),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            BookCard(book: book),
          ],
        /*
        children: [
          
          BookCover(cover: book.cover),
              /*const SizedBox(width: 16),
              Expanded(
                child: Text(book.title, style: Theme.of(context).textTheme.titleLarge),
              ),*/
            
          const SizedBox(height: 12),
          Text(book.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text('Author: ${book.author}', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(book.descriptions),
        ],*/
      ),
    );
  }
}

      
        

 
