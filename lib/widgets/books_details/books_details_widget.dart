import 'package:flutter/material.dart';

import 'books_details_main_booklist_widget.dart';
import 'books_details_main_widget.dart';

class BooksDetailsWidget extends StatefulWidget {
  final int bookId;
  const BooksDetailsWidget({super.key, required this.bookId});

  @override
  State<BooksDetailsWidget> createState() => _BooksDetailsWidgetState();
}

class _BooksDetailsWidgetState extends State<BooksDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('book Screen'),
      ),
      body: ListView(children: [
        BooksDetailsMainWidget(),
        BookdetailsMainBooklistWidget()
      ]),
    );
  }
}
