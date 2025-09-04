class DogModel {
  final String image;
  final String status;

  DogModel({required this.image, required this.status});

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      image: json['message'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );
  }

  bool get isOk => status.toLowerCase() == 'success';
}
