// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DynamicModel {
  double value;
  String lab;
  String date;
  DateTime dateDt;
  DynamicModel({
    required this.value,
    required this.lab,
    required this.date,
    required this.dateDt,
  });

  DynamicModel copyWith({
    double? value,
    String? lab,
    String? date,
    DateTime? dateDt,
  }) {
    return DynamicModel(
      value: value ?? this.value,
      lab: lab ?? this.lab,
      date: date ?? this.date,
      dateDt: dateDt ?? this.dateDt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'lab': lab,
      'date': date,
      'dateDt': dateDt.millisecondsSinceEpoch,
    };
  }

  factory DynamicModel.fromMap(Map<String, dynamic> map) {
    return DynamicModel(
      value: map['value'] ?? 0.0,
      lab: map['lab'] ?? '',
      date: map['date'] ?? '',
      dateDt: DateTime.parse(map['date'] ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory DynamicModel.fromJson(String source) =>
      DynamicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DynamicModel(value: $value, lab: $lab, date: $date, dateDt: $dateDt)';
  }

  @override
  bool operator ==(covariant DynamicModel other) {
    if (identical(this, other)) return true;

    return other.value == value &&
        other.lab == lab &&
        other.date == date &&
        other.dateDt == dateDt;
  }

  @override
  int get hashCode {
    return value.hashCode ^ lab.hashCode ^ date.hashCode ^ dateDt.hashCode;
  }
}
