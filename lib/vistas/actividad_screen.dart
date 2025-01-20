import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ActividadScreen extends StatelessWidget {
  const ActividadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Actividad'),
      ),
      body: ListView(children: const [
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Responde las siguientes preguntas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 117, 0, 102),
                fontFamily: 'AvertaDemoPE',
              ),
            ),
          ),
        ),
        Actividad()
      ]),
    );
  }
}

class Actividad extends StatefulWidget {
  const Actividad({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ActividadState createState() => _ActividadState();
}

class _ActividadState extends State<Actividad> {
  final GlobalKey<FormBuilderState> _quizKey = GlobalKey<FormBuilderState>();
  bool quizChecked = false;
  int respuestasCorrectas = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _quizKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: const Color.fromARGB(255, 221, 250, 255),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormBuilderRadioGroup(
                  decoration: const InputDecoration(
                      labelText:
                          '¿Cual de los siguientes dispositivos fue uno\n de los primeros en implementar la animación?'),
                  name: 'Pregunta 1',
                  orientation: OptionsOrientation.vertical,
                  options: [
                    'Televisores',
                    'Computadora',
                    'Taumátropo',
                    'Consolas'
                  ]
                      .map((option) => FormBuilderFieldOption(value: option))
                      .toList(),
                ),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 221, 250, 255),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormBuilderRadioGroup(
                  decoration: const InputDecoration(
                    labelText: '¿Quien creó el teatro óptico?',
                  ),
                  name: 'Pregunta 2',
                  orientation: OptionsOrientation.vertical,
                  options: [
                    'Émile Reynaud',
                    'Émile Cohl',
                    'Walt Disney',
                    'Rebecca Sugar'
                  ]
                      .map((option) => FormBuilderFieldOption(value: option))
                      .toList(),
                ),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 221, 250, 255),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormBuilderRadioGroup(
                  decoration: const InputDecoration(
                    labelText:
                        '¿Cual es considerada la primera pelicula animada?',
                  ),
                  name: 'Pregunta 3',
                  orientation: OptionsOrientation.vertical,
                  options: [
                    'Blanca Nieves y los 7 Enanitos',
                    'Steamboat willie',
                    'Dumbo',
                    'Fantasmagorie'
                  ]
                      .map((option) => FormBuilderFieldOption(value: option))
                      .toList(),
                ),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 221, 250, 255),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormBuilderRadioGroup(
                  decoration: const InputDecoration(
                    labelText:
                        '¿Que innovacion introdujo Walt Disney en su era dorada?',
                  ),
                  name: 'Pregunta 4',
                  orientation: OptionsOrientation.vertical,
                  options: [
                    'Animación 3D',
                    'Sincronización de sonido y Technicolor',
                    'Animación paso a paso',
                    'Ninguna'
                  ]
                      .map((option) => FormBuilderFieldOption(value: option))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_quizKey.currentState!.saveAndValidate()) {
                  respuestasCorrectas = 0;
                  Map<String, dynamic> formData = _quizKey.currentState!.value;

                  Map<String, dynamic> respuestas = {
                    'Pregunta 1': 'Taumátropo',
                    'Pregunta 2': 'Émile Reynaud',
                    'Pregunta 3': 'Fantasmagorie',
                    'Pregunta 4': 'Sincronización de sonido y Technicolor',
                  };
                  formData.forEach((question, answer) {
                    if (answer == respuestas[question]) {
                      respuestasCorrectas++;
                    }
                  });
                  _mostrarDialogo(context);

                  setState(() {
                    quizChecked = true;
                  });
                }
              },
              child: const Text('Revisar'),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDialogo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Calificación'),
          content: Text(
              'Tuviste : $respuestasCorrectas / ${_quizKey.currentState!.fields.length} respuesta/s correctas'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
