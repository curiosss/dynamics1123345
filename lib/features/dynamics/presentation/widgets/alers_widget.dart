import 'package:dynamics/features/dynamics/models/alert_model.dart';
import 'package:flutter/material.dart';

class AlersWidget extends StatelessWidget {
  final AlertModel alert;
  const AlersWidget({
    super.key,
    required this.alert,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              // 'Biomarkers were submitted a long time ago and indicate illness',
              alert.message,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          if (alert.resubmitLink)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextButton(
                onPressed: () {
                  debugPrint("Resubmit requested");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Resubmit requested')),
                  );
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 6,
                  ),
                ),
                child: const Text(
                  'Resubmit the markers',
                ),
              ),
            ),
        ],
      ),
    );
  }
}
