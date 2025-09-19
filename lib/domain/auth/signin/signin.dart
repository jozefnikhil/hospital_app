class Signin {
  bool? status;
  String? message;
  String? token;
  bool? isSuperuser;
  UserDetails? userDetails;

  Signin({
    this.status,
    this.message,
    this.token,
    this.isSuperuser,
    this.userDetails,
  });

  factory Signin.fromJson(Map<String, dynamic> json) => Signin(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    token: json['token'] as String?,
    isSuperuser: json['is_superuser'] as bool?,
    userDetails: json['user_details'] == null
        ? null
        : UserDetails.fromJson(json['user_details'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'token': token,
    'is_superuser': isSuperuser,
    'user_details': userDetails?.toJson(),
  };
}

class UserDetails {
  int? id;
  dynamic lastLogin;
  String? name;
  String? phone;
  String? address;
  String? mail;
  String? username;
  String? password;
  String? passwordText;
  int? admin;
  bool? isAdmin;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic branch;

  UserDetails({
    this.id,
    this.lastLogin,
    this.name,
    this.phone,
    this.address,
    this.mail,
    this.username,
    this.password,
    this.passwordText,
    this.admin,
    this.isAdmin,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.branch,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json['id'] as int?,
    lastLogin: json['last_login'] as dynamic,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    address: json['address'] as String?,
    mail: json['mail'] as String?,
    username: json['username'] as String?,
    password: json['password'] as String?,
    passwordText: json['password_text'] as String?,
    admin: json['admin'] as int?,
    isAdmin: json['is_admin'] as bool?,
    isActive: json['is_active'] as bool?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    branch: json['branch'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'last_login': lastLogin,
    'name': name,
    'phone': phone,
    'address': address,
    'mail': mail,
    'username': username,
    'password': password,
    'password_text': passwordText,
    'admin': admin,
    'is_admin': isAdmin,
    'is_active': isActive,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'branch': branch,
  };
}
