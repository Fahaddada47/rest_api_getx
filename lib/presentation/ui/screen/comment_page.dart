import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapiwithgets/state_holders/comments_list_contoller.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isInitialized) {
        final controller = Get.find<CommentsController>();
        controller.getCommentApi();
        _isInitialized = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Building CommentPage");

    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: Obx(() {
        final controller = Get.find<CommentsController>();

        if (controller.getCommentsInProgress.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.commentList.isEmpty) {
          return Center(
            child: Text("No comments available."),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            await controller.getCommentApi();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: controller.commentList.length,
              itemBuilder: (context, index) {
                final email = controller.commentList[index].email.toString();
                final name = controller.commentList[index].name.toString();
                return Container(
                  height: 100,
                  child: Column(
                    children: [
                      Text(index.toString()),
                      Text(email),
                      Text(name),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
