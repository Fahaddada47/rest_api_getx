import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapiwithgets/application/state_holder_binder.dart';
import 'package:restapiwithgets/presentation/ui/screen/comment_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: CommentPage(),
      initialBinding: StateHolderBinder(), // Ensure this is set up correctly
    );
  }
}
