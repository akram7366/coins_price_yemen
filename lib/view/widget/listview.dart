import 'package:flutter/material.dart';
import '../../controller.dart';
import 'item.dart';

class HomeListView extends StatelessWidget {
  final HomeController controller;
  const HomeListView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = controller.list;
    return RefreshIndicator(
      onRefresh: controller.load,
      child: ListView.builder(
        itemCount: list.length,
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) => HomeItem(item: list[index]),
      ),
    );
  }
}