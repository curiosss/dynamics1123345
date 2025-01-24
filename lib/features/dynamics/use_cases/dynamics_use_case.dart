import 'package:flutter/material.dart';

class DynamicsUseCase {
  static const Map<int, String> months = {
    1: 'Янв',
    2: 'Фев',
    3: 'Мар',
    4: 'Апр',
    5: 'Май',
    6: 'Июн',
    7: 'Июл',
    8: 'Авг',
    9: 'Сен',
    10: 'Окт',
    11: 'Ноя',
    12: 'Дек',
  };

  static Color getColor(double val) {
    if (val >= 2.8) {
      return Colors.green;
    }
    // return const Color.fromARGB(255, 224, 205, 39);
    return Colors.orange;
  }

  static String getDate(DateTime date) {
    return '${date.day} ${months[date.month] ?? date.month.toString()}';
  }
}
