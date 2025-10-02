abstract class IRegisterPatient {
  Future<void> registerPatient({
    required String name,
    required String payment,
    required String phone,
    required String address,
    required double totalamount,
    required double disamount,
    required double advamount,
    required double balamount,
    required String datntime,
    required String male,
    required String female,
    required String branch,
    required String treatment,
  });
}
