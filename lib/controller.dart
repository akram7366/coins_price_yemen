import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:html/dom.dart' as html;
import 'package:share_plus/share_plus.dart';

import 'main.dart';
import 'model.dart';

class HomeController extends ChangeNotifier {
  final _dio = Dio();
  final _url = 'https://www.almontasaf.net/rate.html';
  StatusRequest _status = StatusRequest.loading;
  List<Model> list = [];

  Future<void> load({bool reload = false}) async {
    if (reload) {
      _status = StatusRequest.loading;
      notifyListeners();
    }
    final list = await _getData();
    if (list == null) {
      _status = StatusRequest.error;
    } else {
      this.list = list;
      _status = StatusRequest.done;
    }
    notifyListeners();
  }

  Future<List<Model>?> _getData() async {
    try {
      final response = await _dio.get(_url);

      if (response.statusCode == 200) {
        final list = await Isolate.run(() {
          List<Model> list = [];

          final document = html.Document.html(response.data);
          final data = document.querySelectorAll('tbody');

          for (int i = 0; i < 2; i++) {
            final gov = data[i].querySelectorAll('tr')
              ..removeAt(0)
              ..removeAt(0);

            final usd = gov[0].querySelectorAll('td');
            final sar = gov[1].querySelectorAll('td');

            final usdSale = usd[2].text;
            final usdBuy = usd[4].text;
            final sarSale = sar[2].text;
            final sarBuy = sar[4].text;

            final date = formatDate(
              DateTime.parse(sar[5].text),
              [yyyy, '-', mm, '-', dd, ' | ', h, ':', nn, ' ', am],
            ).toString().replaceAll('AM', 'ص').replaceAll('PM', 'م');

            final model = Model(
              governorate: i == 0 ? 'صنعاء' : 'عدن',
              usdBuy: usdBuy,
              usdSale: usdSale,
              sarBuy: sarBuy,
              sarSale: sarSale,
              date: date,
            );

            list.add(model);
          }
          return list;
        });

        return list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void share() {
    const line = 'ـــــــــــــــــــــــــــــ';
    const buy = 'شراء';
    const sale = 'بيع';
    const usd = 'دولار';
    const sar = 'سعودي';

    final sanaa = list[0];
    final aden = list[1];

    final sanaaUsd = '$usd | $buy ${sanaa.usdBuy} | $sale ${sanaa.usdSale}';
    final sanaaSar = '$sar | $buy ${sanaa.sarBuy} | $sale ${sanaa.sarSale}';
    final adenUsd = '$usd | $buy ${aden.usdBuy} | $sale ${aden.usdSale}';
    final adenSar = '$sar | $buy ${aden.sarBuy} | $sale ${aden.sarSale}';
    final date = aden.date;

    final finalSanaa = '${sanaa.governorate}\n$sanaaUsd\n$sanaaSar';
    final finalAden = '${aden.governorate}\n$adenUsd\n$adenSar';

    Share.share(
      '$appName | $date\n$line\n$finalSanaa\n$line\n$finalAden',
    );
  }

  bool get loading => _status == StatusRequest.loading;

  bool get done => _status == StatusRequest.done;

  bool get error => _status == StatusRequest.error;
}

enum StatusRequest {
  loading,
  done,
  error,
}
