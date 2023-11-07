import 'dart:math';

import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import 'books_details_main_booklist_widget.dart';

class BooksDetailsMainWidget extends StatelessWidget {
  const BooksDetailsMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(23, 23, 27, 1.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            BookdetailsMainCoverWidget(),
          ],
        ),
      ),
    );
  }
}

class BookdetailsMainCoverWidget extends StatelessWidget {
  BookdetailsMainCoverWidget({super.key});
  final mainTextStyle = TextStyle(color: Colors.white, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(Images.bookCover),
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Автор',
                style: mainTextStyle,
              ),
              Text('1988', style: mainTextStyle),
              Text(
                'Издатель',
                style: mainTextStyle,
              ),
              Text(
                'Количество страниц: ',
                style: mainTextStyle,
              ),
              Text(
                'Язык',
                style: mainTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
