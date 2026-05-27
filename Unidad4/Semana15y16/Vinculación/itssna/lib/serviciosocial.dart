class ServicioSocialModel {
  final String idAlumno;
  final int horasAcumuladas;
  final int horasTotales;
  final String etapaActual;
  final Map<String, String> estatusDocumentos;

  const ServicioSocialModel({
    required this.idAlumno,
    required this.horasAcumuladas,
    required this.horasTotales,
    required this.etapaActual,
    required this.estatusDocumentos,
  });
}