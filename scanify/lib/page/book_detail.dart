import 'package:flutter/material.dart';
import 'package:scanify/entity/book.dart';
import 'package:scanify/service/book_api.dart';

class BookDetail extends StatefulWidget {
  final Book book;
  final BookAPI bookAPI = BookAPI();

  BookDetail({Key key, this.book}) : super(key: key);

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  bool isBookAdded = false;

  @override
  void initState() {
    super.initState();
    checkIfBookIsAddedToFavorites();
  }

  Future<void> checkIfBookIsAddedToFavorites() async {
    bool isAdded = await widget.bookAPI.isAddedToFavorites(widget.book);
    setState(() {
      isBookAdded = isAdded;
    });
  }

  Future<void> addToFavorites() async {
    if (isBookAdded) {
      await widget.bookAPI.removeFromFavorites(widget.book);
    } else {
      await widget.bookAPI.addToFavorites(widget.book);
    }
    checkIfBookIsAddedToFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: widget.book.getAvailableCoverImage() != ''
                  ? Image.network(widget.book.cover.large)
                  : Image.asset('assets/placeholder.png')
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(
                'Author: ${widget.book.getAuthorName()} ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(
                'Publish Date: ${widget.book.publishDate}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(
                'Number of Pages: ${widget.book.numberOfPages}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.redAccent,
                child: FlatButton(
                  onPressed: addToFavorites,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    isBookAdded ? 'Remove from Favorites' : 'Add to Favorites',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
