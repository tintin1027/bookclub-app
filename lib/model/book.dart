import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String author;
  final String title;
  final String descriptions;
  final String cover;
  final String bookid;


const Book({
  required this.author,
  required this.title,
  required this.descriptions,
  required this.cover,
  required this.bookid,

});
@override
  List<Object?> get props => [author, title, descriptions, cover, bookid];
}