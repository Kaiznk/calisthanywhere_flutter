class Exercise {
  late String nombre,
      descripcion,
      muscle,
      previos,
      ayudaA,
      consejo,
      nivel,
      foto;

  Exercise(
    this.nombre,
    this.nivel,
    this.muscle,
    this.previos,
    this.ayudaA,
    this.descripcion,
    this.consejo,
    this.foto,
  );

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'muscle': muscle,
      'previos': previos,
      'ayudaA': ayudaA,
      'consejo': consejo,
      'nivel': nivel,
      'foto': foto,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> data) {
    return Exercise(
      data['nombre'] ?? '',
      data['nivel'] ?? '',
      data['muscle'] ?? '',
      data['previos'] ?? '',
      data['ayudaA'] ?? '',
      data['descripcion'] ?? '',
      data['consejo'] ?? '',
      data['foto'] ?? '',
    );
  }
}
