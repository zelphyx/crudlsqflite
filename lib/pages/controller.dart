import 'package:get/get.dart';
import 'package:local_database/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:local_database/db/db_helper.dart';

class HomeController extends GetxController{
  Database db = DatabaseHelper.getDb();
  RxBool isLoading = false.obs;
  late List<Note> notes;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  void getNotes() async {
    isLoading.value = true;
    List<Map<String,dynamic>> mapNotes = await db.query("Notes");
    notes = mapNotes.map((e) => Note.fromMap(map: e)).toList();
    isLoading.value=false;
    }


  void createNote() async {
    var newnote = await Get.toNamed("/create");
    newnote = newnote as Note?;
    if(newnote != null){
      await db.insert("Notes", newnote.toMap());
      getNotes();
    }
  }

  void deleteNote(int id) async {
    await db.delete("Notes", where: "id = ?", whereArgs: [id]);
    getNotes();
  }

  void editNoteFromPopupMenu(Note note) async {
    var newNote = await Get.toNamed("/create", arguments: note);
    newNote = newNote as Note?;
    if (newNote != null) {
      await db.update("Notes", newNote.toMap(), where: "id = ?", whereArgs: [newNote.id]);
      getNotes();
    }
  }

}