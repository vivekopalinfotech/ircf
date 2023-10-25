class AllListingResponse {
  final int? code;
  final bool? success;
  final List<Course>? course;

  AllListingResponse({
    this.code,
    this.success,
    this.course,
  });

  AllListingResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        success = json['success'] as bool?,
        course = (json['course'] as List?)
            ?.map((dynamic e) => Course.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'success' : success,
    'course' : course?.map((e) => e.toJson()).toList()
  };
}



class Course {
  final int? crs_id;
  final String? crs_name;
  final String? crs_short_name;
  final String? crs_desc;
  final String? crs_amount;
  final int? crs_type;
  final int? crs_category;
  final int? crs_status;
  final String? crs_image;
  final String? course_time;
  final String? crs_crt_background_image;
  final String? crs_created_by;


  Course({
    this.crs_id,
    this.crs_name,
    this.crs_short_name,
    this.crs_desc,
    this.crs_amount,
    this.crs_type,
    this.crs_category,
    this.crs_status,
    this.crs_image,
    this.course_time,
    this.crs_crt_background_image,
    this.crs_created_by,

  });

  Course.fromJson(Map<String, dynamic> json)
      :
        crs_id = json['crs_id'] as int?,
        crs_name = json['crs_name'] as String?,
        crs_short_name = json['crs_short_name'] as String?,
        crs_desc = json['crs_desc'] as String?,
        crs_amount = json['crs_amount'] as String?,
        crs_type = json['crs_type'] as int?,
        crs_category = json['crs_category'] as int?,
        crs_status = json['crs_status'] as int?,
        crs_image = json['crs_image'].toString(),
        course_time = json['course_time'].toString(),
        crs_crt_background_image = json['crs_crt_background_image'].toString(),
        crs_created_by = json['crs_created_by'].toString();


  Map<String, dynamic> toJson() => {
    'crs_id' : crs_id,
    'crs_name' : crs_name,
    'crs_short_name' : crs_short_name,
    'crs_desc' : crs_desc,
    'crs_amount' : crs_amount,
    'crs_type' : crs_type,
    'crs_category' : crs_category,
    'crs_status' : crs_status,
    'crs_image' : crs_image,
    'course_time' : course_time,
    'crs_crt_background_image' : crs_crt_background_image,
    'crs_created_by' : crs_created_by,


  };
}

