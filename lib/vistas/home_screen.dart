import 'package:parcial_final_app/men%C3%BA/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historia de la animación'),
      ),
      body: const _HomeView2(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/creditos');
          },
          tooltip: 'Créditos',
          backgroundColor: Colors.purple,
          child: const Icon(Icons.people)),
    );
  }
}

class _HomeView2 extends StatelessWidget {
  const _HomeView2();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.07,
      ),
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final menuItem = appMenuItems[index];
        // return Text(menuItem.titulo);
        return _CustomGridView(menuItem: menuItem);
      },
    );
  }
}

class _CustomGridView extends StatelessWidget {
  const _CustomGridView({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 126, 126, 126).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      margin: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          context.push(menuItem.link);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  width: 500,
                  height: 500,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(menuItem.imagen),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Text(
                    menuItem.titulo,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    menuItem.subtitulo,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
