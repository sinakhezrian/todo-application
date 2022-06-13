class NoteModel {
  String? text;
  String? label;
 

  NoteModel({
    required this.text,
    required this.label
   
  });

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'text': text,

    };
  }

  NoteModel.formJson(Map<String, dynamic> josn)
      : label = josn['label'],
        text = josn['text'];
}
