import 'dart:ui';

class Note {
  String id = "";
  String title = "";
  String? description = "";
  Color color;

  Note({
    required this.id,
    required this.title,
    required this.color,
    this.description,
  });
}
