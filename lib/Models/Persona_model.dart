class PersonaDni {
  final String dni;
  final String nombres;
  final String apellidoPaterno;
  final String apellidoMaterno;

  PersonaDni({
    required this.dni,
    required this.nombres,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
  });

  factory PersonaDni.fromJson(Map<String, dynamic> json) {
    return PersonaDni(
      dni: json['dni'] ?? json['numero'] ?? '',
      nombres: json['nombres'] ?? '',
      apellidoPaterno:
          json['apellidoPaterno'] ?? json['apellido_paterno'] ?? '',
      apellidoMaterno:
          json['apellidoMaterno'] ?? json['apellido_materno'] ?? '',
    );
  }
}
