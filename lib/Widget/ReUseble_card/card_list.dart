import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericCardListView<T> extends StatelessWidget {
  final RxList<T> itemList;
  final String Function(T item) primaryLabelBuilder;
  final String Function(T item)? subtitleBuilder;
  final void Function(int index)? onEditPressed;
  final void Function(int index)? onDeletePressed;
  final String? headerTitle;

  const GenericCardListView({
    Key? key,
    required this.itemList,
    required this.primaryLabelBuilder,
    this.subtitleBuilder,
    this.onEditPressed,
    this.onDeletePressed,
    this.headerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerTitle != null
          ? AppBar(
              title: Text(headerTitle!),
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black87),
            )
          : null,
      body: Container(
        width: double.infinity,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 5),
              Expanded(
                child: Obx(() => ListView.builder(
                      itemCount: itemList.length,
                      itemBuilder: (context, index) {
                        final item = itemList[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            title: Text(
                              primaryLabelBuilder(item),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: subtitleBuilder != null
                                ? Text(subtitleBuilder!(item))
                                : null,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (onEditPressed != null)
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => onEditPressed!(index),
                                  ),
                                if (onDeletePressed != null)
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => onDeletePressed!(index),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
