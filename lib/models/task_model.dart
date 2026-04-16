class TaskModel {
  final String? id;
  final String title;
  final String description;
  final DateTime? createdAt;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json, String docId) {
    return TaskModel(
      id: docId,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}