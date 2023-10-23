// ignore_for_file: non_constant_identifier_names

class UserResponse {
  final User? user;
  final String? access_token;

  UserResponse({
    this.user,
    this.access_token,
  });

  UserResponse.fromJson(Map<String, dynamic> json)
      : user = (json['user'] as Map<String, dynamic>?) != null ? User.fromJson(json['user'] as Map<String, dynamic>) : null,
        access_token = json['access_token'] as String?;

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'access_token': access_token,
      };
}

class User {
  final int? id;
  final String? ppl_name;
  final String? ppl_met_on;
  final String? ppl_gender;
  final String? ppl_dob;
  final String? ppl_address;
  final String? ppl_title_id;
  final String? ppl_remark;
  final String? mobile;
  final String? email;
  final String? student_code;
  final String? user_type;
  final String? ppl_profile_image;

  User({
    this.id,
    this.ppl_name,
    this.ppl_met_on,
    this.ppl_gender,
    this.ppl_dob,
    this.ppl_address,
    this.ppl_title_id,
    this.ppl_remark,
    this.mobile,
    this.email,
    this.student_code,
    this.user_type,
    this.ppl_profile_image,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        ppl_name = json['ppl_name'] as String?,
        ppl_met_on = json['ppl_met_on'].toString(),
        ppl_gender = json['ppl_gender'].toString(),
        ppl_dob = json['ppl_dob'] as String?,
        ppl_address = json['ppl_address'] as String?,
        ppl_title_id = json['ppl_title_id'] as String?,
        ppl_remark = json['ppl_remark'].toString(),
        mobile = json['mobile'].toString(),
        email = json['email'].toString(),
        student_code = json['student_code'].toString(),
        user_type = json['user_type'].toString(),
        ppl_profile_image = json['ppl_profile_image'] as String?;

  Map<String, dynamic> toJson() => {
    'id': id,
    'ppl_name': ppl_name,
    'ppl_met_on': ppl_met_on,
    'ppl_gender': ppl_gender,
    'ppl_dob': ppl_dob,
    'ppl_address': ppl_address,
    'ppl_title_id': ppl_title_id,
    'ppl_remark': ppl_remark,
    'mobile': mobile,
    'email': email,
    'student_code': student_code,
    'user_type': user_type,
    'ppl_profile_image': ppl_profile_image,
  };
}


