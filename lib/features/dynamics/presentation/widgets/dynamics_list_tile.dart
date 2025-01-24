import 'package:dynamics/features/dynamics/models/dynamic_model.dart';
import 'package:dynamics/features/dynamics/use_cases/dynamics_use_case.dart';
import 'package:flutter/material.dart';

class DynamicsListTile extends StatelessWidget {
  final DynamicModel dynamicModel;
  const DynamicsListTile({
    super.key,
    required this.dynamicModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: [
          Text(
            // DateFormat('d MMM', 'ru_RU').format(dynamicModel.dateDt),
            DynamicsUseCase.getDate(dynamicModel.dateDt),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                dynamicModel.lab,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Text(
            dynamicModel.value.toStringAsFixed(1),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: DynamicsUseCase.getColor(dynamicModel.value),
            ),
          ),
        ],
      ),
    );
  }
}
