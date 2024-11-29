import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_atten/Controller/Designation_Controller/designation_controller.dart';
import 'package:time_atten/Screen/Main_Designation_Screen/main_designation_screen.dart';

// Import your designation-related files
// import 'designation_controller.dart';
// import 'main_designation_screen.dart';

void main() {
  // Initialize GetX controller
  Get.put(DesignationController());
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Designation Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainDesignationScreen(),
    );
  }
}