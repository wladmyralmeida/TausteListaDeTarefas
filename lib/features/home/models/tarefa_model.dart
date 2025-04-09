class TarefaModel {
  final String titulo;
  final bool isCompleted;
  final String? descricao;

  TarefaModel({
    required this.titulo,
    required this.isCompleted,
    this.descricao,
  });

  factory TarefaModel.fromJson(Map<String, dynamic> json) {
    return TarefaModel(
        titulo: json['title'],
        descricao: json['descricao'] ?? '',
        isCompleted: json['completed']);
  }
}
