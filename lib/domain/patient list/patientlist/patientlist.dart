class Patientlist {
  bool? status;
  String? message;
  List<Patient>? patient;

  Patientlist({this.status, this.message, this.patient});

  factory Patientlist.fromJson(Map<String, dynamic> json) => Patientlist(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    patient: (json['patient'] as List<dynamic>?)
        ?.map((e) => Patient.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'patient': patient?.map((e) => e.toJson()).toList(),
  };
}

class Branch {
  int? id;
  String? name;
  int? patientsCount;
  String? location;
  String? phone;
  String? mail;
  String? address;
  String? gst;
  bool? isActive;

  Branch({
    this.id,
    this.name,
    this.patientsCount,
    this.location,
    this.phone,
    this.mail,
    this.address,
    this.gst,
    this.isActive,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json['id'] as int?,
    name: json['name'] as String?,
    patientsCount: json['patients_count'] as int?,
    location: json['location'] as String?,
    phone: json['phone'] as String?,
    mail: json['mail'] as String?,
    address: json['address'] as String?,
    gst: json['gst'] as String?,
    isActive: json['is_active'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'patients_count': patientsCount,
    'location': location,
    'phone': phone,
    'mail': mail,
    'address': address,
    'gst': gst,
    'is_active': isActive,
  };
}

class PatientdetailsSet {
  int? id;
  String? male;
  String? female;
  int? patient;
  int? treatment;
  String? treatmentName;

  PatientdetailsSet({
    this.id,
    this.male,
    this.female,
    this.patient,
    this.treatment,
    this.treatmentName,
  });

  factory PatientdetailsSet.fromJson(Map<String, dynamic> json) {
    return PatientdetailsSet(
      id: json['id'] as int?,
      male: json['male'] as String?,
      female: json['female'] as String?,
      patient: json['patient'] as int?,
      treatment: json['treatment'] as int?,
      treatmentName: json['treatment_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'male': male,
    'female': female,
    'patient': patient,
    'treatment': treatment,
    'treatment_name': treatmentName,
  };
}

class Patient {
  int? id;
  List<PatientdetailsSet>? patientdetailsSet;
  Branch? branch;
  String? user;
  String? payment;
  String? name;
  String? phone;
  String? address;
  dynamic price;
  int? totalAmount;
  int? discountAmount;
  int? advanceAmount;
  int? balanceAmount;
  dynamic dateNdTime;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  Patient({
    this.id,
    this.patientdetailsSet,
    this.branch,
    this.user,
    this.payment,
    this.name,
    this.phone,
    this.address,
    this.price,
    this.totalAmount,
    this.discountAmount,
    this.advanceAmount,
    this.balanceAmount,
    this.dateNdTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json['id'] as int?,
    patientdetailsSet: (json['patientdetails_set'] as List<dynamic>?)
        ?.map((e) => PatientdetailsSet.fromJson(e as Map<String, dynamic>))
        .toList(),
    branch: json['branch'] == null
        ? null
        : Branch.fromJson(json['branch'] as Map<String, dynamic>),
    user: json['user'] as String?,
    payment: json['payment'] as String?,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    address: json['address'] as String?,
    price: json['price'] as dynamic,
    totalAmount: json['total_amount'] as int?,
    discountAmount: json['discount_amount'] as int?,
    advanceAmount: json['advance_amount'] as int?,
    balanceAmount: json['balance_amount'] as int?,
    dateNdTime: json['date_nd_time'] as dynamic,
    isActive: json['is_active'] as bool?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'patientdetails_set': patientdetailsSet?.map((e) => e.toJson()).toList(),
    'branch': branch?.toJson(),
    'user': user,
    'payment': payment,
    'name': name,
    'phone': phone,
    'address': address,
    'price': price,
    'total_amount': totalAmount,
    'discount_amount': discountAmount,
    'advance_amount': advanceAmount,
    'balance_amount': balanceAmount,
    'date_nd_time': dateNdTime,
    'is_active': isActive,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
