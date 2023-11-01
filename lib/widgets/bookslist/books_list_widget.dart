import 'package:flutter/material.dart';
import '../../resources/resources.dart';

class BookItem {
  final String imageName;
  final String title;
  final String author;
  final String description;

  BookItem(
      {required this.imageName,
      required this.title,
      required this.author,
      required this.description});
}

class BooksListwidget extends StatefulWidget {
  BooksListwidget({super.key});

  @override
  State<BooksListwidget> createState() => _BooksListwidgetState();
}

class _BooksListwidgetState extends State<BooksListwidget> {
  final _booksList = [
    BookItem(
      imageName: Images.bookCover,
      title: 'Магический поединок',
      author: 'Брэд Карстен',
      description:
          'Есть произведения, которые можно читать и перечитывать много раз. Книга Антуана де Сент-Экзюпери «Маленький принц» одна из таких. С момента первого издания в 1943 году она входит в число самых читаемых в мире. Ее автор, французский летчик и писатель, взрослый, так и оставшийся в душе ребенком. Книга «Маленький принц» рассказывает о необыкновенной встрече пилота (из-за неполадок в моторе летчику пришлось посадить самолет в пустыне) с Маленьким принцем, гостем с другой планеты.',
    ),
    BookItem(
      imageName: Images.duna,
      title: 'Дюна',
      author: 'Фрэнк Герберт',
      description:
          'Фрэнк Герберт успел написать много, но в истории остался прежде всего как автор эпопеи "Дюна". Возможно, самой прославленной фантастической саги двадцатого столетия, саги, переведенной на десятки языков и завоевавшей по всему миру миллионы поклонников.',
    ),
    BookItem(
        imageName: Images.frai,
        title: 'Наваждения',
        author: 'Макс Фрай',
        description:
            '«Наваждения» — пятый том фэнтези-сериала Лабиринты Ехо Макса Фрая. Книга содержит две повести, повествующие о приключениях сэра Макса в мире Ехо'),
    BookItem(
      imageName: Images.sun,
      title: 'Успеть до захода солнца',
      author: 'Нора Робертс',
      description:
          'На курорте в Западной Монтане найдено тело молодой женщины. Для Бодин убийство становится шокирующим напоминанием о старой потере. Двадцать пять лет назад ее тетя Элис бесследно исчезла, и теперь Бодин связывает новую трагедию с событиями прошлого.',
    ),
    BookItem(
      imageName: Images.duna,
      title: 'Дюна',
      author: 'Фрэнк Герберт',
      description:
          'Фрэнк Герберт успел написать много, но в истории остался прежде всего как автор эпопеи "Дюна". Возможно, самой прославленной фантастической саги двадцатого столетия, саги, переведенной на десятки языков и завоевавшей по всему миру миллионы поклонников.',
    ),
    BookItem(
        imageName: Images.tuman,
        title: 'Туман в лесах Барнаула',
        author: 'Дмитрий Петров',
        description:
            'Мирон Ушаков - черный копатель. Однажды Мирон отправляется в таинственное место под названием Чертово городище, чтобы раздобыть клад Кудеяра-разбойника. Однако все очень скоро начинает идти не по плану, и Мирон становится заложником страшного сказочного места, где у времени свои правила.'),
    BookItem(
        imageName: Images.molot,
        title: 'Молот ведьм',
        author: 'Шпренгер, Инститорис',
        description:
            'Знаменитый средневековый трактат "Молот ведьм" написан в конце 15 века теологами-доминиканцами Я. Шпренгером и Г. Инститорисом. Этот труд объединил опыт борьбы инквизиции с многочисленными ересями, став самым значительным документом того времени.')
  ];

  var _filteredBook = <BookItem>[];

  final searchController = TextEditingController();

  void _searchBook() {
    final query = searchController.text;

    if (query.isNotEmpty) {
      _filteredBook = _booksList.where((BookItem item) {
        return item.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredBook = _booksList;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredBook = _booksList;
    searchController.addListener(_searchBook);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(top: 70),
          itemCount: _filteredBook.length,
          itemExtent: 150,
          itemBuilder: (BuildContext context, int index) {
            final bookItem = _filteredBook[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 3.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.black12,
                      ),
                    ),
                    child: Row(children: [
                      Image(
                        image: AssetImage(bookItem.imageName),
                        width: 80,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bookItem.title,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                bookItem.author,
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontStyle: FontStyle.italic),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                bookItem.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      onTap: () => print('tapped'),
                      splashColor: Colors.black26,
                    ),
                  ),
                ],
              ),
            );
            //
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(500),
            ),
          ),
        ),
      ],
    );
  }
}
