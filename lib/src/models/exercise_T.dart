class ExerciseT {
  late String nombre,
      descripcion,
      muscle,
      previos,
      ayudaA,
      consejo,
      nivel,
      foto;
  late int serie, reps;

  ExerciseT(
    this.nombre,
    this.nivel,
    this.muscle,
    this.serie,
    this.reps, // <-- Asegúrate de incluir reps
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
      'serie': serie,
      'reps': reps, // <-- Guardar reps en el mapa
      'previos': previos,
      'ayudaA': ayudaA,
      'consejo': consejo,
      'nivel': nivel,
      'foto': foto,
    };
  }

  factory ExerciseT.fromMap(Map<String, dynamic> data) {
    return ExerciseT(
      data['nombre'] ?? '',
      data['nivel'] ?? '',
      data['muscle'] ?? '',
      data['serie'] ?? 3,
      data['reps'] ?? 10, // <-- Asignar reps, por defecto 10 si es null
      data['previos'] ?? '',
      data['ayudaA'] ?? '',
      data['descripcion'] ?? '',
      data['consejo'] ?? '',
      data['foto'] ?? '',
    );
  }
}
