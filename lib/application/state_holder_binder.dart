import 'package:get/get.dart';
import 'package:restapiwithgets/state_holders/comments_list_contoller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
       // Get.put(CommentsController());
       Get.lazyPut<CommentsController>(() => CommentsController());

  }
}
