import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String image;

  UserModel({required this.name, required this.image});
}