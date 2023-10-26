class NextModuleResponse{
  final bool? success;
  final String? message;

  NextModuleResponse(this.success, this.message);

  NextModuleResponse.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?;
  Map<String, dynamic> toJson() => {
    'success' : success,
    'message' : message,
  };

}