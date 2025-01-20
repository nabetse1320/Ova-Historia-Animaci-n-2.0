import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Los orígenes prehistóricos: Las primeras representaciones visuales',
      'La animación tiene sus raíces en el deseo humano de capturar el movimiento. Desde las pinturas rupestres en cuevas como las de Lascaux, que mostraban animales en diferentes posiciones, hasta los primeros intentos de representar el movimiento, se buscó dar vida a las imágenes estáticas. Aunque rudimentarios, estos esfuerzos marcaron el inicio de nuestra fascinación por la animación.',
      'assets/rupestres.jpg'),
  SlideInfo(
      'Juguetes ópticos: El inicio del entretenimiento visual',
      'En el siglo XIX, los juguetes ópticos revolucionaron la percepción del movimiento. Dispositivos como el taumátropo (1824), el fenaquistiscopio (1832) y el zootropo (1834) permitieron que las personas observaran imágenes en movimiento por primera vez. Estos inventos basados en el principio de la persistencia de la visión sentaron las bases para la animación moderna.',
      'assets/taumatropo.jpg'),
  SlideInfo(
      'El Teatro Óptico: La transición hacia narrativas animadas',
      'En 1892, Émile Reynaud creó el Teatro Óptico, una máquina que proyectaba imágenes animadas en movimiento continuo. Con su invención, Reynaud presentó los primeros espectáculos animados, conocidos como pantomimas luminosas, combinando narrativas simples y música en vivo, un precursor directo del cine animado.',
      'assets/teatro.jpg'),
  SlideInfo(
      'Las primeras películas animadas: El nacimiento de un arte',
      'En 1908, Émile Cohl creó Fantasmagorie, considerada la primera película animada de la historia. Este corto de dibujos hechos a mano marcó un hito al mostrar cómo la animación podía contar historias completas. A partir de este momento, otros pioneros, como Winsor McCay con Gertie the Dinosaur (1914), comenzaron a explorar el potencial narrativo de la animación.',
      'assets/fantasmagorie.jpg'),
  SlideInfo(
      'Innovaciones técnicas y el camino al cine animado',
      'A medida que la animación avanzaba, surgieron técnicas como la animación cuadro por cuadro y el uso de celdas transparentes, desarrolladas por Bray y Hurd en la década de 1910. Estas innovaciones aceleraron la producción y definieron los métodos del cine animado. La combinación de avances técnicos y creatividad sentó las bases para la Edad de Oro de la animación en las décadas posteriores.',
      'assets/pasoApaso.jpg'),
];

class PrimerosPasosScreen extends StatefulWidget {
  static const name = 'primerosPasos_screen';

  const PrimerosPasosScreen({super.key});

  @override
  State<PrimerosPasosScreen> createState() => _PrimerosPasosScreenState();
}

class _PrimerosPasosScreenState extends State<PrimerosPasosScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicios'),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          const Positioned(
              right: 30,
              top: 40,
              child: Icon(
                Icons.swipe_right,
                size: 50,
              )),
          const Positioned(
              left: 30,
              top: 40,
              child: Icon(
                Icons.swipe_left,
                size: 50,
              )),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    child: FilledButton(
                      onPressed: () => context.go('/'),
                      child: const Text('Volver'),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
