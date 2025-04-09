class TarefaModel {
  final int id;
  final String titulo;
  final bool isCompleted;
  final String? descricao;

  TarefaModel({
    required this.id,
    required this.titulo,
    required this.isCompleted,
    this.descricao,
  });

  factory TarefaModel.fromJson(Map<String, dynamic> json) {
    return TarefaModel(
        id: json['id'],
        titulo: json['title'],
        descricao: json['descricao'] ?? '',
        isCompleted: json['completed']);
  }
}
