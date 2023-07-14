import 'package:coins_price_yemen/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeError extends StatelessWidget {
  const HomeError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'خطأ في الأتصال بالشبكة',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => context.read<HomeController>().load(reload: true),
            child: const Text(
              'إعادة المحاولة',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
