import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scanify/service/book_api.dart';

import '../entity/book.dart';
import 'book_detail.dart';
import 'favorites.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future scan() async {
    String scannedCode = await FlutterBarcodeScanner.scanBarcode('#FFF', 'Cancel', true, ScanMode.DEFAULT);
    Book book = await BookAPI().makeRequest(scannedCode);
    navigateToBookDetail(book);
  }

  void navigateToBookDetail(Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetail(book: book),
      ),
    );
  }

  void goToFavorites() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Favorites(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanify'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              color: Colors.amber[700],
              padding: EdgeInsets.all(16),
              onPressed: scan,
              child: Text(
                'Press to scan barcode',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            FlatButton(
              color: Colors.red[700],
              padding: EdgeInsets.all(16),
              onPressed: goToFavorites,
              child: Text(
                'Go to Favorites',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
