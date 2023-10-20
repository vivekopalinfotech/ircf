class CourseListingResponse {
  final int? code;
  final bool? success;
  final Category? category;
  final List<CourseDetail>? course_detail;

  CourseListingResponse({
    this.code,
    this.success,
    this.category,
    this.course_detail,
  });

  CourseListingResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        success = json['success'] as bool?,
        category = (json['category'] as Map<String,dynamic>?) != null ? Category.fromJson(json['category'] as Map<String,dynamic>) : null,
        course_detail = (json['course_detail'] as List?)
            ?.map((dynamic e) => CourseDetail.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'success' : success,
    'category' : category?.toJson(),
    'course_detail' : course_detail?.map((e) => e.toJson()).toList()
  };
}

class Category {

  final int? cat_id;
  final String? cat_name;
  final String? slug;


  Category({

    this.cat_id,
    this.cat_name,
    this.slug,
  });

  Category.fromJson(Map<String, dynamic> json)
      :
        cat_id = json['cat_id'] as int?,
        cat_name = json['cat_name'] as String?,
        slug = json['slug'] as String?;

  Map<String, dynamic> toJson() => {
    'cat_id' : cat_id,
    'cat_name' : cat_name,
    'slug' : slug
  };
}


class CourseDetail {
  final int? crs_id;
  final String? crs_name;
  final String? crs_short_name;
  final int? crs_type;


  CourseDetail({
    this.crs_id,
    this.crs_name,
    this.crs_short_name,
    this.crs_type,

  });

  CourseDetail.fromJson(Map<String, dynamic> json)
      :
        crs_id = json['crs_id'] as int?,
        crs_name = json['crs_name'] as String?,
        crs_short_name = json['crs_short_name'] as String?,
        crs_type = json['crs_type'] as int?;


  Map<String, dynamic> toJson() => {
    'crs_id' : crs_id,
    'crs_name' : crs_name,
    'crs_short_name' : crs_short_name,
    'crs_type' : crs_type,


  };
}

