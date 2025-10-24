import 'package:equatable/equatable.dart';
import '../model/book.dart';
import 'sort_book.dart';

enum ViewMode {list, detail}

class HomeState extends Equatable{
  final List<Book> books;
  final SortBook sortBook;
  final ViewMode mode;
  final Book? selected;
  final bool loading;

  const HomeState ({
    this.books = const [],
    this.sortBook = SortBook.author,
    this.mode = ViewMode.list,
    this.selected,
    this.loading = false,
  });

  HomeState copyWith ({
    List<Book>? books,
    SortBook? sortBook,
    ViewMode? mode,
    Book? selected,
    bool? loading,
  }) => HomeState(
    books: books ?? this.books,
    sortBook: sortBook ?? this.sortBook,
    mode: mode ?? this.mode,
    selected: selected,
    loading: loading ?? this.loading,
  );
   @override
  List<Object?> get props => [books, mode, selected, sortBook,loading];
}