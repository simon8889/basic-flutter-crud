class Persona {
  final int? id;
  final String nombre;
  final String apellido;
  final String documento;
  final int edad;
  final String email;
  final String telefono;
  
  Persona({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.documento,
    required this.edad,
    required this.email,
    required this.telefono,
  });
  
  factory Persona.fromMap(Map<String, dynamic> map) {
    return Persona(
      id: map['id'] as int?,
      nombre: map['nombre'] as String,
      apellido: map['apellido'] as String,
      documento: map['documento'] as String,
      edad: map['edad'] as int,
      email: map['email'] as String,
      telefono: map['telefono'] as String,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'documento': documento,
      'edad': edad,
      'email': email,
      'telefono': telefono,
    };
  }
  
  Persona copyWith({
    int? id,
    String? nombre,
    String? apellido,
    String? documento,
    int? edad,
    String? email,
    String? telefono,
  }) {
    return Persona(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      documento: documento ?? this.documento,
      edad: edad ?? this.edad,
      email: email ?? this.email,
      telefono: telefono ?? this.telefono,
    );
  }
  
  @override
  String toString() {
    return 'Persona{id: $id, nombre: $nombre, apellido: $apellido, documento: $documento, edad: $edad, email: $email, telefono: $telefono}';
  }
}