class MyCoursesResponse {
  final int? code;
  final int? total_complete_count;
  final int? total_module_count;
  final bool? success;

  final List<Data>? data;

  MyCoursesResponse({
    this.code,
    this.success,
    this.total_complete_count,
    this.total_module_count,

    this.data,
  });

  MyCoursesResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        total_complete_count = json['total_complete_count'] as int?,
        total_module_count = json['total_module_count'] as int?,
        success = json['success'] as bool?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'total_complete_count' : total_complete_count,
    'total_module_count' : total_module_count,
    'success' : success,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}




class Data {
  final int? std_id;
  final int? std_ppl_id;
  final int? std_batch;
  final int? crs_id;
  final String? crs_name;
  final String? crs_short_name;
  final String? crs_image;
  final String? crs_amount;
  final String? course_time;



  Data({
    this.std_id,
    this.std_ppl_id,
    this.std_batch,
    this.crs_id,
    this.crs_name,
    this.crs_short_name,
    this.crs_image,
    this.crs_amount,
    this.course_time,

  });

  Data.fromJson(Map<String, dynamic> json)
      :
        std_id = json['std_id'] as int?,
        std_ppl_id = json['std_ppl_id'] as int?,
        std_batch = json['std_batch'] as int?,
        crs_id = json['crs_id'] as int?,
        crs_name = json['crs_name'] as String?,
        crs_short_name = json['crs_short_name'] as String?,
        crs_image = json['crs_image'] as String?,
        crs_amount = json['crs_amount'] as String?,
        course_time = json['course_time'] as String?;


  Map<String, dynamic> toJson() => {
    'std_id' : std_id,
    'std_ppl_id' : std_ppl_id,
    'std_batch' : std_batch,
    'crs_id' : crs_id,
    'crs_name' : crs_name,
    'crs_short_name' : crs_short_name,
    'crs_image' : crs_image,
    'crs_amount' : crs_amount,
    'course_time' : course_time,


  };
}

