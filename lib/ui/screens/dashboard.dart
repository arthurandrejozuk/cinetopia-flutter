import 'package:cinetopia/ui/screens/releases.dart';
import 'package:cinetopia/ui/screens/search_movies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

// Para o dashboard, para que fosse usado nas duas páginas e não repetir código, foi feito um statefull widget
class _DashboardState extends State<Dashboard> {
  // indica o index selecionado
  int _currentIndex = 0;
  // para indicar a página, foi posta as widgets numa variavel
  final List<Widget> _screens = <Widget>[SearchMovies(), Releases()];

  // faz a atualização do index das páginas com o index
  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF1D0E44)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 54, 16, 0),
          // recebe o widget do index atual
          child: _screens.elementAt(_currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // atualiza o index
        currentIndex: _currentIndex,
        onTap: (value) => updateIndex(value),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Filmes"),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: "Lançamentos",
          ),
        ],
      ),
    );
  }
}
