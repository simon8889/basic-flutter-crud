class Persona {
  final int? id;
  final String nombre;
  final String apellido;
  final String telefono;
  final int edad;
  final String email;
  
  Persona({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required this.edad,
    required this.email,
  });
  
  factory Persona.fromMap(Map<String, dynamic> map) {
    return Persona(
      id: map['id'] as int?,
      nombre: map['nombre'] as String,
      apellido: map['apellido'] as String,
      telefono: map['telefono'] as String,
      edad: map['edad'] as int,
      email: map['email'] as String,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'telefono': telefono,
      'edad': edad,
      'email': email,
    };
  }
  
  Persona copyWith({
    int? id,
    String? nombre,
    String? apellido,
    String? telefono,
    int? edad,
    String? email,
  }) {
    return Persona(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      telefono: telefono ?? this.telefono,
      edad: edad ?? this.edad,
      email: email ?? this.email,
    );
  }
}