import 'package:dynamics/core/error/k_error.dart';
import 'package:dynamics/core/network/network_service.dart';
import 'package:dynamics/features/dynamics/models/alert_model.dart';
import 'package:dynamics/features/dynamics/models/dynamic_model.dart';
import 'package:dynamics/injection_container.dart';

class DynamicsRepository {
  NetworkService networkService = getIt<NetworkService>();

  Future<(List<DynamicModel>?, List<AlertModel>?, KError?)> getAll() async {
    try {
      var response = await networkService.httpClient.get('/health_mock');
      if (response.statusCode == 200 && response.data != null) {
        List<DynamicModel>? dynamics;
        if (response.data['dynamics'] != null) {
          dynamics = List<DynamicModel>.from(response.data['dynamics'].map((e) {
            return DynamicModel.fromMap(e);
          }));
        }

        List<AlertModel>? alerts;
        if (response.data['alerts'] != null) {
          alerts = List<AlertModel>.from(response.data['alerts'].map((e) {
            return AlertModel.fromMap(e);
          }));
        }

        return (dynamics, alerts, null);
      }
      return (null, null, ParseError());
    } catch (e) {
      return (null, null, NetworkError());
    }
  }
}
