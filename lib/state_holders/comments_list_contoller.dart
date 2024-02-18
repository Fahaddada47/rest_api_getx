import 'package:get/get.dart';
import 'package:restapiwithgets/data/models/CommentsModel.dart';
import 'package:restapiwithgets/data/services/network_caller.dart';

class CommentsController extends GetxController {
  final List<CommentsModel> commentList = <CommentsModel>[];
  final RxBool getCommentsInProgress = false.obs; // Use RxBool

  Future<void> getCommentApi() async {
    try {
      print("Fetching comments...");
      getCommentsInProgress.value = true;

      final List<CommentsModel> comments = await NetworkCaller.getApi(
        'https://jsonplaceholder.typicode.com/comments',
        (data) => CommentsModel.fromJson(data),
      );

      commentList.assignAll(comments);
      print("Fetched ${commentList.length} comments");
    } catch (e) {
      print("Error in getCommentApi: $e");

      Get.snackbar("Error", "Failed to fetch comments. Please try again.");
    } finally {
      getCommentsInProgress.value = false;
      print("Comments fetching complete.");
    }
  }

  void updateGetCommentsInProgress(bool value) {
    getCommentsInProgress.value = value;
  }
}
