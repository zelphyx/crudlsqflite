import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/note.dart';

class CreateController extends GetxController{
  var titlecontroller = TextEditingController();
  var contentcontroller = TextEditingController();
  Note? oldnote;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    oldnote = Get.arguments as Note?;

    if(oldnote != null){
      titlecontroller.text = oldnote!.title;
      contentcontroller.text = oldnote!.content;
    }
  }

  void onSubmit(){
    if(titlecontroller.text.trim().isNotEmpty &&
        contentcontroller.text.trim().isNotEmpty
    ){
      Get.back(
        result: Note(
            title: titlecontroller.text,
            content: contentcontroller.text,
            id: oldnote?.id
        )
      );
    }
  }




}