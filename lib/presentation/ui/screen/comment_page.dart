import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapiwithgets/state_holders/comments_list_contoller.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => Get.find<CommentsController>().getCommentApi(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<CommentsController>().getCommentApi();
        },
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<CommentsController>(
        builder: (commentsController) {
          if (commentsController.getCommentsInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: commentsController.commentList.length,
            itemBuilder: (context, index) {
              final email = commentsController.commentList[index].email.toString();
              final name = commentsController.commentList[index].name.toString();
              return Container(
                height: 100,
                child: Column(
                  children: [
                    Text(email),
                    Text(name),
                  ],
                ),
              );
            },
          );
        },
      ),
    ),

    ),
    );
  }
}
