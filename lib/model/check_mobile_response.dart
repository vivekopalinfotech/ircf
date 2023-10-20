class MobileResponse{
  final String? message;

  MobileResponse(this.message);

  MobileResponse.fromJson(Map<String, dynamic> json)
      :
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'message' : message,
  };
}