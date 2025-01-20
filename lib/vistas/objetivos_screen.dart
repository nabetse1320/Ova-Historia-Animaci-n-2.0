import 'package:flutter/material.dart';

class ObjetivosScreen extends StatelessWidget {
  const ObjetivosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Objetivos'),
      ),
      body: _ObjetivoWidget(),
    );
  }
}

class _ObjetivoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const <Widget>[
        ObjetivoItem(
          institution: 'Objetivo general',
          description:
              'Comprender la evolución histórica, técnica y cultural de la animación, reconociendo su impacto en la sociedad y los medios audiovisuales, para valorar su contribución al arte y la tecnología.',
          icono: Icons.flag,
        ),
        ObjetivoItem(
          institution: 'Objetivos específicos',
          description:
              '• Identificar los principales hitos históricos y figuras clave que han marcado la evolución de la animación, desde sus inicios hasta la actualidad.\n\n• Analizar las diferentes técnicas y estilos de animación, comprendiendo cómo han influido en la creación de narrativas audiovisuales y experiencias visuales.\n\n• Reflexionar sobre el impacto cultural, educativo y social de la animación en diversas épocas y su relevancia en los medios contemporáneos.',
          icono: Icons.subdirectory_arrow_right,
        ),
      ],
    );
  }
}

class ObjetivoItem extends StatelessWidget {
  final String institution;
  final String description;
  final IconData icono;

  const ObjetivoItem({
    super.key,
    required this.institution,
    required this.description,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 237, 251, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                child: Icon(
                  icono,
                  size: 50,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 30, 0),
                  child: Text(
                    institution,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
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
    );
  }
}
