// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AlertModel {
  String message;
  bool resubmitLink;
  AlertModel({
    required this.message,
    required this.resubmitLink,
  });

  AlertModel copyWith({
    String? message,
    bool? resubmitLink,
  }) {
    return AlertModel(
      message: message ?? this.message,
      resubmitLink: resubmitLink ?? this.resubmitLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'resubmitLink': resubmitLink,
    };
  }

  factory AlertModel.fromMap(Map<String, dynamic> map) {
    return AlertModel(
      message: map['message'] ?? '',
      resubmitLink: map['resubmitLink'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlertModel.fromJson(String source) =>
      AlertModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AlertModel(message: $message, resubmitLink: $resubmitLink)';

  @override
  bool operator ==(covariant AlertModel other) {
    if (identical(this, other)) return true;

    return other.message == message && other.resubmitLink == resubmitLink;
  }

  @override
  int get hashCode => message.hashCode ^ resubmitLink.hashCode;
}
