import 'package:hive/hive.dart';

part 'userCredentialModel.g.dart';

@HiveType(typeId: 1)
class UserCredential {
  @HiveField(0)
  String email;

  @HiveField(1)
  String password;

  UserCredential({required this.email, required this.password});
}