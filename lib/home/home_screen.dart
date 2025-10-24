import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_cubit.dart';
import 'home_state.dart';
import 'sort_book.dart';
import '../widget/book_cover.dart';
import '../model/book.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFFEF7FF),
            elevation: 0,
            leading: state.mode == ViewMode.detail
                ? IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => cubit.backToList(),
                  )
                : IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {},
                  ),
            centerTitle: true,
            title: Text(
              state.mode == ViewMode.detail ? 'Book Detail' : 'Book Club Home',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.account_circle_outlined, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),

          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: state.mode == ViewMode.detail
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BookCover(cover: state.selected!.cover),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                state.selected!.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Author: ${state.selected!.author}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(state.selected!.descriptions),
                      ],
                    ),
                  )
      
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Sort by', style: TextStyle(fontSize: 14)),
                          const SizedBox(width: 12),
                          _SortButton(
                            label: 'Author',
                            selected: state.sortBook == SortBook.author,
                            onTap: () => cubit.sortByAuthor(),
                          ),
                          const SizedBox(width: 12),
                          _SortButton(
                            label: 'Title',
                            selected: state.sortBook == SortBook.title,
                            onTap: () => cubit.sortByTitle(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text('Books', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.books.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final book = state.books[index];
                            return GestureDetector(
                              onTap: () => cubit.openBook(book),
                              child: Column(
                                children: [
                                  BookCover(cover: book.cover),
                                  const SizedBox(height: 8),
                                  /*
                                  SizedBox(
                                    width: 100,
                                    
                                    child: Text(
                                      state.sortBook == SortBook.author
                                          ? book.author
                                          : book.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),*/
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ); 
      },
    ); 
  }
}


class _SortButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SortButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: selected ? const Color.fromARGB(255, 164, 120, 229) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF49454F), width: 1),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
