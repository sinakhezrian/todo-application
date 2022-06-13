class TaskModel {
  String? title;
  String? note;
  String? label;
  bool? status;
  bool? archive;

  TaskModel({
    required this.title,
    required this.note,
    required this.status,
    required this.label,
    required this.archive,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'note': note,
      'status': status,
      'label': label,
      'archive': archive,
    };
  }

  TaskModel.formJson(Map<String, dynamic> josn)
      : title = josn['title'],
        note = josn['note'],
        status = josn['status'],
        label = josn['label'],
        archive = josn['archive'];
}
