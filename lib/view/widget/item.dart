import 'package:coins_price_yemen/model.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final Model item;

  const HomeItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  item.governorate,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    item.date,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  children: [
                    Text(
                      'العملة',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.7,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'دولار',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.7,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'سعودي',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'شراء',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      item.usdBuy,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      item.sarBuy,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'بيع',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      item.usdSale,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      item.sarSale,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
