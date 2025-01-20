import 'package:flutter/material.dart';

class IntroduccionScreen extends StatelessWidget {
  const IntroduccionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introducción'),
      ),
      body: _IntroduccionWidget(),
    );
  }
}

class _IntroduccionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image.asset('assets/Banner1.jpg'),
        const Modulo(
          institution: '¿Qué es la animación?',
          description:
              'La animación es el proceso de crear la ilusión de movimiento mediante la secuencia rápida de imágenes estáticas. Cada imagen o fotograma representa un momento en el tiempo, y al mostrarse de manera continua a una velocidad adecuada (normalmente 24 fotogramas por segundo en cine), el cerebro humano percibe movimiento fluido.\n\nEn términos generales, la animación es el arte de dar vida a objetos, personajes o escenarios inanimados, transformándolos en historias visuales dinámicas.',
        ),
        const Modulo(
          institution: 'Caracteristicas clave de la animación',
          description:
              '1) Ilusión de movimiento: Basada en el fenómeno de la persistencia de la visión, que permite al ojo humano retener una imagen por una fracción de segundo después de que desaparece.\n\n2) Secuencia: Cada cuadro (o fotograma) tiene ligeras variaciones que generan continuidad al reproducirse.\n\n3) Versatilidad: Puede utilizarse en cine, televisión, videojuegos, publicidad, educación y arte.\n\n4) Creatividad ilimitada: Permite representar lo que no puede ser filmado en la realidad, como mundos imaginarios, criaturas fantásticas o fenómenos abstractos.',
        ),
        const Modulo2(
          institution: 'Tipos de animación',
          description:
              '1) Animación tradicional: Dibujos hechos a mano que se fotografían cuadro a cuadro.\n\n2) Stop-motion: Movimiento físico de objetos o figuras fotografiados en cada posición.\n\n3) Animación por computadora: Creación digital en 2D o 3D mediante software especializado.\n\n4) Animación experimental: Uso de técnicas no convencionales como arena, pintura o collage.\n\nEn esencia, la animación combina arte y técnica para contar historias, transmitir emociones y desafiar los límites de lo que podemos imaginar.',
          image: 'assets/tipos-de-animacion.jpg',
        ),
        const Modulo2(
          institution: 'Importancia de la animación',
          description:
              'La animación es una herramienta versátil que combina arte y tecnología para comunicar ideas, contar historias y despertar emociones. Su capacidad de simplificar conceptos complejos la hace ideal para la educación, la ciencia y la publicidad, mientras que su poder narrativo conecta a las audiencias a través de personajes y relatos universales. Además, la animación permite una expresión artística ilimitada, explorando mundos y estilos imposibles de recrear en la realidad, lo que fomenta la innovación creativa.\n\nMás allá del entretenimiento, su impacto se extiende a la cultura, la educación y la tecnología. Ha dado vida a íconos globales como Mickey Mouse, transformado la enseñanza con recursos animados y revolucionado industrias mediante avances como el CGI y la realidad aumentada. La animación no solo inspira, sino que también transforma la forma en que entendemos y experimentamos el mundo.',
          image: 'assets/importancia.jpg',
        ),
      ],
    );
  }
}

class Modulo extends StatelessWidget {
  final String institution;
  final String description;

  const Modulo({
    super.key,
    required this.institution,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Text(
                institution,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Modulo2 extends StatelessWidget {
  final String institution;
  final String description;
  final String image;

  const Modulo2({
    super.key,
    required this.institution,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
              child: Text(
                institution,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Image.asset(
                image,
                width: 500,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
