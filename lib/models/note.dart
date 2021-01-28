class Note
{
  int id;
  String title;
  String description;


  Note(this.id,this.title,this.description);
  // Note.withoutID(this.title,this.Description);

int get _id => id;

String get _title => title;

String get _description => description;


set _title(String newtitle){
  this.title =newtitle;
}

}