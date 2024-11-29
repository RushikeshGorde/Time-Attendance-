import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_atten/Button/custom_action_button.dart';
import 'package:time_atten/Controller/Designation_Controller/designation_controller.dart';
import 'package:time_atten/View/Designation_Dialog/designation_dialog.dart';
import 'package:time_atten/Widget/Alert_Box/genericdialogfunction.dart';
import 'package:time_atten/Widget/ReUseble_card/card_list.dart';

class MainDesignationScreen extends StatelessWidget {
  MainDesignationScreen({Key? key}) : super(key: key);

  final DesignationController controller = Get.find<DesignationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Designation'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          CustomActionButton(
            label: 'Add Designation',
            onPressed: () => _showSmallDesignationDialog(context),
          ),
        ],
      ),
      body: GenericCardListView<String>(
        itemList: controller.masterDesignations,
        primaryLabelBuilder: (item) => item,
        subtitleBuilder: (item) => "Master Designation: $item",
        onEditPressed: (index) => _showEditDialog(context, index),
        onDeletePressed: (index) => controller.deleteDesignation(index),
      ),
    );
  }

  // Show the designation dialog for adding a new designation
  void _showSmallDesignationDialog(BuildContext context) {
    showCustomDialog(
      context: context,
      dialogContent: DesignationDialog(controller: controller),
    );
  }

  // Show the designation dialog for editing an existing designation
  void _showEditDialog(BuildContext context, int index) {
    controller.setDesignationName(controller.masterDesignations[index]);

    showCustomDialog(
      context: context,
      dialogContent: DesignationDialog(controller: controller),
    );
  }
}
