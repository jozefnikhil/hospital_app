
class Branchlist {
  bool? status;
  String? message;
  List<Branch>? branches;

  Branchlist({this.status, this.message, this.branches});

  factory Branchlist.fromJson(Map<String, dynamic> json) => Branchlist(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    branches: (json['branches'] as List<dynamic>?)
        ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'branches': branches?.map((e) => e.toJson()).toList(),
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
