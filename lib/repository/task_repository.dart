import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ui_class/models/task_model.dart';

class TaskRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _tasksCollection =>
      _firestore.collection('tasks');

  Future<void> addTask(TaskModel task) async {
    await _tasksCollection.add(task.toJson());
  }

  Future<void> deleteTask(String id) async {
    await _tasksCollection.doc(id).delete();
  }

  Stream<List<TaskModel>> getTasks() {
    return _tasksCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TaskModel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }
}