class RegisterResponse{
  final bool? success;
  final String? message;

  RegisterResponse(this.success,this.message);

  RegisterResponse.fromJson(Map<String, dynamic> json)
      :
        success = json['success'] as bool?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'message' : message,
  };
}