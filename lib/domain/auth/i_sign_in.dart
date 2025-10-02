import 'package:amrita_treatment/domain/auth/signin/signin.dart';

abstract class ISignIn {
  Future<Signin?> signin({required String username, required String password});
}
