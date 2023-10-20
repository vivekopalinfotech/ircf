class CourseCategoryResponse {
  final int? code;
  final bool? success;

  final List<CourseCategory>? course_category;

  CourseCategoryResponse({
    this.code,
    this.success,
    this.course_category,
  });

  CourseCategoryResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        success = json['success'] as bool?,
        course_category = (json['course_category'] as List?)
            ?.map((dynamic e) => CourseCategory.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'success' : success,
    'course_category' : course_category?.map((e) => e.toJson()).toList()
  };
}





class CourseCategory {
  final int? cat_id;
  final String? cat_name;
  final String? slug;


  CourseCategory({
    this.cat_id,
    this.cat_name,
    this.slug,
  });

  CourseCategory.fromJson(Map<String, dynamic> json)
      :
        cat_id = json['cat_id'] as int?,
        cat_name = json['cat_name'] as String?,
        slug = json['slug'] as String?;

  Map<String, dynamic> toJson() => {
    'cat_id' : cat_id,
    'cat_name' : cat_name,
    'slug' : slug,

  };
}

class CoursePdf{
  final int? course_pdf_id;
  final int? course_module_id;
  final String? course_pdf;


  CoursePdf({

    this.course_pdf_id,
    this.course_module_id,
    this.course_pdf,

  });

  CoursePdf.fromJson(Map<String, dynamic> json)
      :
        course_pdf_id = json['course_pdf_id'] as int?,
        course_module_id = json['course_module_id'] as int?,
        course_pdf = json['course_pdf'] as String?;

  Map<String, dynamic> toJson() => {

    'course_pdf_id' : course_pdf_id,
    'course_module_id' : course_module_id,
    'course_pdf' : course_pdf,

  };
}

class CourseVideos{
  final int? course_video_id;
  final int? course_module_id;
  final String? course_video;


  CourseVideos({

    this.course_video_id,
    this.course_module_id,
    this.course_video,

  });

  CourseVideos.fromJson(Map<String, dynamic> json)
      :
        course_video_id = json['course_video_id'] as int?,
        course_module_id = json['course_module_id'] as int?,
        course_video = json['course_video'] as String?;

  Map<String, dynamic> toJson() => {

    'course_video_id' : course_video_id,
    'course_module_id' : course_module_id,
    'course_video' : course_video,

  };
}