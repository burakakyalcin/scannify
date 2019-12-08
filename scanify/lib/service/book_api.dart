import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scanify/entity/book.dart';


class BookAPI {

  Future<Book> makeRequest(String code) async {
    Response response = await get('https://openlibrary.org/api/books?bibkeys=ISBN:$code&jscmd=data&format=json');
    if (response.statusCode == 200) {
      Map<String, dynamic> bookMap = jsonDecode(response.body);
      Book book = Book.fromJson(bookMap['ISBN:$code']);
      return book;
    } else {
      return null;
    }
  }

  Future<bool> isAddedToFavorites(Book book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> booksStringList  = prefs.getStringList('books');

    if (booksStringList != null) {
      bool isAdded = false;
      booksStringList.forEach((bookString) {
        Map<String, dynamic> map = jsonDecode(bookString);
        Book localBook = Book.fromJson(map);
        if (localBook.key == book.key) {
          isAdded = true;
        }
      });
      return isAdded;
    } else {
      return false;
    }
  }

  Future<void> addToFavorites(Book book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> booksStringList = prefs.getStringList('books');

    if (booksStringList != null) {
      booksStringList.add(jsonEncode(book));
      prefs.setStringList('books', booksStringList);
    } else {
      List<String> bookList = [jsonEncode(book)];
      prefs.setStringList('books', bookList);
    }
  }

  Future<void> removeFromFavorites(Book book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> booksStringList = prefs.getStringList('books');

    if (booksStringList != null) {
      List<Book> bookList = [];
      booksStringList.forEach((bookString) {
        Map<String, dynamic> map = jsonDecode(bookString);
        Book localBook = Book.fromJson(map);
        if (localBook.key != book.key) {
          bookList.add(localBook);
        }
      });

      List<String> bookStringList = [];
      bookList.forEach((localBook) {
        String stringBook = jsonEncode(localBook);
        bookStringList.add(stringBook);
      });

      prefs.setStringList('books', bookStringList);

    }
  }

  Future<List<Book>> getBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> booksStringList = prefs.getStringList('books');

    if (booksStringList== null) {
      return [];
    } else {
      List<Book> bookList = [];
      booksStringList.forEach((bookString) {
        Map<String, dynamic> map = jsonDecode(bookString);
        Book localBook = Book.fromJson(map);
        bookList.add(localBook);
      });
      return bookList;
    }
  }

}