class NoteBook{
  dynamic id;
  dynamic title;
  dynamic content;
  dynamic date;

  NoteBook({this.id, this.title, this.content, this.date});

  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "id":id,
      "title":title,
      "content":content,
      "date":date
    };
  }
}
