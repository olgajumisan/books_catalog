import 'package:flutter/material.dart';
import 'package:ll_movie_db/widgets/auth/auth_widget.dart';
import 'package:ll_movie_db/widgets/books_details/books_details_widget.dart';
import 'package:ll_movie_db/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: Color.fromRGBO(3, 37, 65, 1)),
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(3, 37, 65, 1),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey),
      ),
      routes: {
        '/auth_screen': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
        '/main_screen/books_detail': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return BooksDetailsWidget(bookId: arguments);
          } else
            return BooksDetailsWidget(bookId: 1);
        },
      },
      initialRoute: '/auth_screen',
      /*onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(child: Text('Произошла ошибка')),
            );
          },
        );
      },*/
    );
  }
}
