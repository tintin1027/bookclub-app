import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/book.dart';
import 'home_state.dart';
import 'sort_book.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    _init();
  }
  Future<void> _init() async{
    emit(state.copyWith(loading:true));
    await Future.delayed (const Duration(milliseconds:100));
    final initial = [
      Book(
        author: 'Sarah Jean Horwitz',
        title: 'Carmer and Grit: The Wingsnatchers',
        descriptions: _lorem,
        cover: 'assets/covers/carmer_and_grit.jpg',
        bookid: 'book_001',
      ),
      Book(
        author: 'Angelina Aludo',
        title: 'The Imperfections of Memory',
        descriptions: _lorem,
        cover: 'assets/covers/the_imperfections_of_memory.jpg',
        bookid: 'book_002',
      ),
      Book(
        author: 'Roald Dahl',
        title: 'James and the Giant Peach',
        descriptions: _lorem,
        cover: 'assets/covers/james_and_the_giant_peach.jpg',
        bookid: 'book_003',
      ),
      Book(
        author: 'Meng Jin',
        title: 'Little Gods',
        descriptions: _lorem,
        cover: 'assets/covers/little_gods.jpg',
        bookid: 'book_004',
      ),
      Book(
        author: 'Anthony Burgess',
        title: 'A Clockwork Orange',
        descriptions: _lorem,
        cover: 'assets/covers/a_clockwork_orange.jpg',
        bookid: 'book_005',
      ),
      Book(
        author: 'Hisham Al Gurg',
        title: 'The Big Deal: 6 Steps Formula',
        descriptions: _lorem,
        cover: 'assets/covers/the_big_deal.jpg',
        bookid: 'book_006',
      ),
      Book(
        author: 'Isaac Nelson',
        title: 'Don’t Look Back',
        descriptions: _lorem,
        cover: 'assets/covers/dont_look_back.jpg',
        bookid: 'book_007',
      ),
    ];
    emit(state.copyWith(loading: false, books: _sorted(initial, state.sortBook)));
  }
  List<Book> _sorted(List<Book> list, SortBook sortBook){
    final sorted = List<Book>.from(list);
    sorted.sort((a,b){
      if(sortBook == SortBook.author){
        return a.author.compareTo(b.author);
      } else{
        return a.title.compareTo(b.title);
      }
    });
    return sorted;
  }

  void _setSort(SortBook e){
    final sorted = _sorted(state.books, e);
    if (identical(sorted,state.books)){
      emit(state.copyWith(loading:true));
    }
    emit(state.copyWith(sortBook: e,books:sorted, loading:false));
    }
  void sortByAuthor () => _setSort(SortBook.author);
  void sortByTitle () => _setSort(SortBook.title);
  void openBook(Book b) => emit(state.copyWith(mode: ViewMode.detail, selected: b));
  void backToList() => emit(state.copyWith(mode: ViewMode.list, selected: null));

}
const _lorem =
    'Lorem ipsum dolor sit amet consectetur. Id tincidunt tristique vitae at pharetra. Commodo volutpat lacus adipiscing at elit semper eget turpis ut. Gravida faucibus faucibus ornare consectetur enim cursus tellus. Est varius vel egestas velit orci. Neque nam ultricies augue nunc vel pulvinar sed massa. Pellentesque netus pellentesque egestas aliquam maecenas amet libero integer. Ut eleifend platea massa diam ut. Egestas odio massa aliquet pellentesque quis laoreet sed. Sodales rhoncus nisi sit vel non leo ultricies ut facilisi. Adipiscing a augue id volutpat rhoncus in nec enim. In dictum egestas at dui. Quam quis consectetur nec id accumsan et fusce. Diam amet morbi lorem massa risus libero ac. Elit integer ut libero malesuada et tortor elementum porttitor. Arcu sed augue orci felis nam volutpat placerat. Sapien nulla diam fringilla ut vestibulum eget. Sodales id orci habitant at. Rhoncus pharetra eu posuere porttitor. Mauris odio vehicula eu orci consectetur dui sit varius. Laoreet sed viverra massa malesuada odio dictum justo quam quisque. Eros bibendum neque cras ut. Purus dolor ut pretium diam. Nunc lectus lacus sapien ultricies est pharetra. Sagittis eu rhoncus integer ridiculus morbi. Auctor in ultricies euismod sit in tincidunt velit aliquam. Egestas arcu et at feugiat elit risus et diam. Placerat urna sapien proin neque habitasse vivamus scelerisque. Id id cursus egestas nibh. Dictum non malesuada vitae proin. Nulla tempus odio tellus phasellus viverra ac sit dui ornare. Potenti a in massa iaculis faucibus in. Adipiscing posuere id blandit libero suspendisse. Suspendisse sed lobortis nec tellus. Velit adipiscing fames gravida nulla. Hac fermentum volutpat sit fusce sem pharetra orci. Odio facilisi dui turpis tortor mattis. Blandit faucibus ut tortor sed non vivamus venenatis. Cursus neque tortor in platea. Etiam fringilla v';
