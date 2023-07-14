import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> about(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    elevation: 0,
    builder: (context) => const _About(),
  );
}

class _About extends StatelessWidget {
  const _About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.background,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 3),
            blurRadius: 15,
          ),
        ],
        // border:
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(
                  Icons.close,
                ),
              ),
              const SizedBox(width: 15),
              const Text(
                'حول',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
            child: Text(
              'تم برمجة وتطوير التطبيق بواسطة أكرم محمد حسين المنذري',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              launchUrl(
                Uri(
                  scheme: 'mailto',
                  path: 'support@akram7366.com',
                ),
              );
            },
            child: const Text(
              'للتواصل',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
