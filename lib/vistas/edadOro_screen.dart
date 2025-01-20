import '../vistas/screen.dart';

class EdadOroScreen extends StatelessWidget {
  const EdadOroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Epoca dorada de la animación'),
        ),
        body: const AnimationDemo());
  }
}

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 150,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset('assets/banner2.jpg'),
            ),
          ),
        ),
        const TarjetaConImagen(
          titulo: "EL ASCENSO DE LOS GRANDES ESTUDIOS",
          texto:
              "La Edad de Oro de la animación, que abarcó desde los años 1920 hasta mediados de los 1950, comenzó con la consolidación de estudios como Walt Disney, Warner Bros. y Fleischer Studios. Estos estudios establecieron estándares en la producción de cortometrajes animados para el cine, creando personajes icónicos y revolucionando la industria del entretenimiento con su creatividad y ambición técnica.",
          imagenFondo: "assets/castillo.jpg",
          tamanoFondo: 500,
        ),
        const TarjetaSinImagen(
          titulo: "INNOVACIONES TECNOLÓGICAS QUE MARCARON UNA ERA",
          texto:
              "Walt Disney lideró la innovación con Steamboat Willie (1928), el primer corto con sincronización completa de sonido, y más tarde con Blancanieves y los siete enanitos (1937), el primer largometraje animado en Technicolor. Estas obras demostraron cómo la animación podía ser tanto artística como comercialmente exitosa, impulsando su aceptación como una forma de arte legítima.",
          imagen: 'assets/Snowwhite.png',
        ),
        const TarjetaConImagen(
          titulo: 'LOS PERSONAJES ICONICOS DE UNA GENERACIÓN',
          texto:
              'Durante esta época, surgieron personajes que se convirtieron en símbolos de la cultura popular, como Mickey Mouse, Bugs Bunny, Popeye y Betty Boop. Estos personajes no solo entretenían, sino que también representaban aspectos de la sociedad y el humor de su tiempo, convirtiéndose en referencias culturales que aún perduran.',
          imagenFondo: 'assets/personajes.png',
          tamanoFondo: 600,
        ),
        const TarjetaSinImagen(
            titulo: 'EL AUGE DE LOS CORTOMETRAJES ANIMADOS',
            texto:
                'Los cortometrajes animados se convirtieron en piezas fundamentales de los programas de cine. Series como Looney Tunes y Merrie Melodies ofrecían entretenimiento rápido y dinámico, destacándose por su ingenio y la calidad de su animación. Este formato permitió que los estudios experimentaran con estilos y narrativas, fortaleciendo su dominio en el mercado.',
            imagen: 'assets/looneyToons.png')
      ],
    );
  }
}

class TarjetaConImagen extends StatelessWidget {
  final String titulo;
  final String texto;
  final String imagenFondo;
  final double tamanoFondo;
  const TarjetaConImagen({
    super.key,
    required this.titulo,
    required this.texto,
    required this.imagenFondo,
    required this.tamanoFondo,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: tamanoFondo,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            image: DecorationImage(
              image: AssetImage(imagenFondo),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(55.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 109, 211),
                  fontSize: 24,
                  fontFamily: 'AvertaDemoPE',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                texto,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 91, 0, 151),
                  fontFamily: 'AvertaDemoPE',
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(child: Icon(Icons.keyboard_arrow_down_rounded))
            ],
          ),
        ),
      ],
    );
  }
}

class TarjetaSinImagen extends StatelessWidget {
  final String titulo;
  final String texto;
  final String imagen;
  const TarjetaSinImagen(
      {super.key,
      required this.titulo,
      required this.texto,
      required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 109, 211),
              fontSize: 24,
              fontFamily: 'AvertaDemoPE',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Text(
              texto,
              style: const TextStyle(
                color: Color.fromARGB(255, 91, 0, 151),
                fontFamily: 'AvertaDemoPE',
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset(imagen)
        ],
      ),
    );
  }
}
