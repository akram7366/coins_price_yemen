import 'package:coins_price_yemen/controller.dart';
import 'package:coins_price_yemen/view/widget/error.dart';
import 'package:coins_price_yemen/view/widget/listview.dart';
import 'package:coins_price_yemen/view/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'bottom_sheet/about.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController? controller;

  @override
  Widget build(BuildContext context) {
    controller ??= context.watch()?..load();

    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        actions: [
          if (controller!.done && controller!.list.isNotEmpty)
            IconButton(
              onPressed: controller!.share,
              icon: const Icon(Icons.share),
            ),
          IconButton(
            onPressed: () => about(context),
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: controller!.loading
          ? const HomeLoading()
          : controller!.error
          ? const HomeError()
          : HomeListView(controller: controller!),
    );
  }
}
