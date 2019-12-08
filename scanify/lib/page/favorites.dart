import 'package:flutter/material.dart';
import 'package:scanify/entity/book.dart';
import 'package:scanify/service/book_api.dart';

import 'book_detail.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Book> books;

  void navigateToBookDetail(Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetail(book: book),
      ),
    );
  }

  Future<void> getFavorites() async {
    List<Book> books = await BookAPI().getBooks();
    setState(() {
      this.books = books;
    });
  }

  @override
  void initState() {
    super.initState();
    getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Container(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetail(book: books[index]),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundImage: books[index].getAvailableCoverImage() != ''
                    ? NetworkImage(books[index].cover.large)
                    : AssetImage('assets/placeholder.png')
              ),
              title: Text(books[index].title),
              subtitle: Text(books[index].getAuthorName()),
            ),
          );
        },
      )
    );
  }
}
