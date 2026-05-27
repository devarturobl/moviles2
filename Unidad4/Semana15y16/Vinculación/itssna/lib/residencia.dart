class ProyectoResidenciaModel {
  final String idProyecto;
  final String titulo;
  final String empresa;
  final String sector;
  final int vacantesDisponibles;
  final List<String> requisitosPerfil;

  const ProyectoResidenciaModel({
    required this.idProyecto,
    required this.titulo,
    required this.empresa,
    required this.sector,
    required this.vacantesDisponibles,
    required this.requisitosPerfil,
  });
}