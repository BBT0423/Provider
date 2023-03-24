import 'package:flutter/foundation.dart';
import 'package:flutter_application_6/data_trans.dart';
import 'package:sembast/sembast.dart';
import './data_model.dart';

class test_provider extends ChangeNotifier {
  List<BookModel> bookDetail = [
    // BookModel(ISBN: '9503895032134', bookName: 'Mobile Dev.', price: 250),
    // BookModel(ISBN: '6578543298797', bookName: 'Flutter', price: 350),
    // BookModel(ISBN: '6330200483', bookName: 'ไก่อ่อน', price: 50),
  ];

  List<BookModel> getData() {
    return bookDetail;
  }

  addBook(BookModel bookData) async {
    var db = await transactionDB(dbName: 'transections.db');
    //print(db);

    await db.insertData(bookData);

    bookDetail = await db.selectData();

    //bookDetail.insert(0, bookData);
    //bookDetail.add(bookData);
    notifyListeners();
  }

  initalBook() async {
    var db = await transactionDB(dbName: 'transections.db');
    bookDetail = await db.selectData();
    notifyListeners();
  }
}
