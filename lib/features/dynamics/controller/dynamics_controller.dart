import 'package:dynamics/core/error/k_error.dart';
import 'package:dynamics/features/dynamics/models/alert_model.dart';
import 'package:dynamics/features/dynamics/models/dynamic_model.dart';
import 'package:dynamics/features/dynamics/repositories/dynamics_repository.dart';
import 'package:flutter/material.dart';

class DynamicsController with ChangeNotifier {
  DynamicsRepository dynamicsRepository = DynamicsRepository();

  KError? error;
  List<DynamicModel> dynamics = [];
  AlertModel? alert;
  bool isloading = false;

  Future<void> getDynamics() async {
    error = null;
    dynamics.clear();
    alert=null;

    isloading = true;
    notifyListeners();

    final res = await dynamicsRepository.getAll();

    error = res.$3;
    if (res.$1 != null) {
      dynamics.addAll(res.$1!);
    }

    if (res.$2 != null && res.$2!.isNotEmpty) {
      alert = res.$2!.first;
    }

    isloading = false;
    notifyListeners();
  }
}
