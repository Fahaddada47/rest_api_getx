

import 'package:get/get.dart';
import 'package:restapiwithgets/data/models/CommentsModel.dart';

import 'package:restapiwithgets/data/services/network_caller.dart';
import 'package:restapiwithgets/data/utility/urls.dart';


class CommentsController extends GetxController {
  final List<CommentsModel> commentList = <CommentsModel>[];
  bool getCommentsInProgress = false;

  Future<void> getCommentApi() async {
    // final url = "https://jsonplaceholder.typicode.com/comments";
    getCommentsInProgress = true;

    try {
      final List<CommentsModel> comments = await NetworkCaller.getApi(
      Urls.verifyComments(),
            (data) => CommentsModel.fromJson(data),
      );

      commentList.assignAll(comments);
      print(commentList);
    } finally {
      getCommentsInProgress = false; // Change from true to false
      print(commentList);

    }
  }
}
