import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapiwithgets/application/state_holder_binder.dart';
import 'package:restapiwithgets/presentation/ui/screen/comment_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: CommentPage(),
      initialBinding: StateHolderBinder(),
    );
  }
}
