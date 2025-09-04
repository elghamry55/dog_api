import 'package:dio/dio.dart';
import '../models/dog_model.dart';

final Dio dio = Dio();

Future<DogModel> getData() async {
  final response = await dio.get('https://dog.ceo/api/breeds/image/random');
  final data = response.data as Map<String, dynamic>;

  print(data);

  final model1 = DogModel.fromJson(data);

  print(model1.image);

  return model1;
}
