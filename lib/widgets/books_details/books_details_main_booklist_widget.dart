import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class BookdetailsMainBooklistWidget extends StatelessWidget {
  const BookdetailsMainBooklistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Список похожих книг',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 300,
          child: Scrollbar(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8.0,
                          blurStyle: BlurStyle.solid,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(Images.cat),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Название книги',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Автор автор'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('1996'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 20,
              itemExtent: 110,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }
}
