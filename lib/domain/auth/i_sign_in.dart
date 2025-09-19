import 'package:amrita_ayurveda/domain/auth/signin/signin.dart';

abstract class ISignIn {
  Future<Signin?> signin({required String username, required String password});
}
