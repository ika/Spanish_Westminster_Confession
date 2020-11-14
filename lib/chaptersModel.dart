class Chapter {
  int id;
  String chap;
  String title;
  String text;

  Chapter({this.id, this.chap, this.title, this.text});

  // used for retrieving data from the database
  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        chap: json["chap"],
        title: json["title"],
        text: json["text"],
      );

  // used when inserting data to the database
  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "id" : id,
      "chap": chap,
      "title" : title,
      "text" : text,
    };
  }
}
