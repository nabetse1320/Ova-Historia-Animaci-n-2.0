class MenuItem {
  final String titulo;
  final String subtitulo;
  final String link;
  final String imagen;

  MenuItem(
      {required this.titulo,
      required this.subtitulo,
      required this.link,
      required this.imagen});
}

final appMenuItems = <MenuItem>[
  MenuItem(
    titulo: 'Objetivos',
    subtitulo: 'Objetivos general y especificos',
    link: '/objetivos',
    imagen: 'assets/objetivos.jpg',
  ),
  MenuItem(
    titulo: 'Introducción',
    subtitulo: 'Introducción a la animación',
    link: '/proposito',
    imagen: 'assets/introduccion.jpg',
  ),
  MenuItem(
    titulo: 'Inicios',
    subtitulo: 'Primeros pasos de la animación',
    link: '/historia',
    imagen: 'assets/inicio.png',
  ),
  MenuItem(
      titulo: 'Edad de Oro',
      subtitulo: 'La era de oro de la animación',
      link: '/diferencia',
      imagen: 'assets/epocaOro.jpg'),
  MenuItem(
      titulo: 'Principios',
      subtitulo: '12 principios de la animación',
      link: '/principios',
      imagen: 'assets/principios.jpg'),
  MenuItem(
      titulo: 'Actividad',
      subtitulo: 'Actividad del OVA',
      link: '/actividad',
      imagen: 'assets/actividades.jpg'),
];
