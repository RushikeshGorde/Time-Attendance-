// designation_controller.dart
import 'package:get/get.dart';
import 'package:time_atten/Model/Designation_Model/designation_model.dart';
// import 'designation_model.dart';

class DesignationController extends GetxController {
  // Reactive observable for the current designation
  final designation = DesignationModel().obs;

  // Observable lists for designations
  final masterDesignations = <String>[
    'Senior Manager',
    'Site Engineer',
    'Team Lead',
    'Junior Developer',
    'N / A'
  ].obs;

  final masterDesignations1 = <String>[
    'Manager',
    'Engineer',
    'Team Lead',
    'Developer',
    'Intern'
  ].obs;

  // Setter methods for updating designation properties
  void setDesignationName(String value) {
    designation.update((val) {
      val?.designationName = value;
    });
  }

  void setMasterDesignation(String? value) {
    designation.update((val) {
      val?.masterDesignation = value;
    });
  }

  // Save designation method with validation
  void saveDesignation() {
    if (designation.value.designationName?.isEmpty ?? true) {
      Get.snackbar(
        'Error', 
        'Designation name is required',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    
    // Here you would typically add logic to save to a database
    Get.snackbar(
      'Success', 
      'Designation saved successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Cancel and reset designation
  void cancelDesignation() {
    designation.value = DesignationModel();
    Get.back();
  }

  // Method to delete a designation
  void deleteDesignation(int index) {
    if (index >= 0 && index < masterDesignations.length) {
      masterDesignations.removeAt(index);
      masterDesignations1.removeAt(index);
      Get.snackbar(
        'Success', 
        'Designation deleted successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}