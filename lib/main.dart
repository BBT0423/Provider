import 'package:flutter/material.dart';
import 'package:flutter_application_6/add_from.dart';
import 'package:flutter_application_6/test_provider.dart';
import 'package:provider/provider.dart';

void main() {
  var app = MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((_) {
        return test_provider();
      }))
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
  runApp(app);
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//สร้างข้อมูลรายการหนังสือ
  @override
  void initalBook() {
    super.initState();
    Provider.of<test_provider>(context, listen: false).initalBook();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการหนังสือ'),
      ),
//แสดงรายการหนังสือทั้งหมดในหน้าแอพพลิเคชัน
      body: Consumer(builder: (context, test_provider provider, child) {
        if (provider.bookDetail.length <= 0) {
          return Center(
            child: Text(
              'ไม่มีรายการหนังสือ',
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: provider.bookDetail.length,
            itemBuilder: (context, index) {
              var bookList = provider.bookDetail[index];
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(bookList.bookName),
                    Text(bookList.price.toString()),
                  ],
                ),
                subtitle: Text(bookList.ISBN),
              );
            },
          );
        }
      }),
//ปุ่มบวกมุมล่างขวา
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddForm()));
        },
      ),
    );
  }
}
