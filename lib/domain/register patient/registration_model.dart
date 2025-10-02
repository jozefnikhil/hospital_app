class PatientRegistration {
  final String name;
  final String address;
  final String phone;
  final String location;
  final String? branchId;
  final String? treatmentId;
  final List<Map<String, dynamic>> patients;
  final double totalAmount;
  final double discountAmount;
  final String paymentOption;
  final double advanceAmount;
  final double balanceAmount;
  final String dateNdTime;

  PatientRegistration({
    required this.name,
    required this.address,
    required this.phone,
    required this.location,
    this.branchId,
    this.treatmentId,
    required this.patients,
    required this.totalAmount,
    required this.discountAmount,
    required this.paymentOption,
    required this.advanceAmount,
    required this.balanceAmount,
    required this.dateNdTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'executive': 'jibesh',
      'phone': phone,
      'location': location,
      'branch_id': branchId,
      'treatment_id': treatmentId,
      'patients': patients,
      'id': '',
      'total_amount': totalAmount,
      'discount_amount': discountAmount,
      'payment_option': paymentOption,
      'advance_amount': advanceAmount,
      'balance_amount': balanceAmount,
      'date_nd_time': dateNdTime,
    };
  }
}
