// ignore_for_file: non_constant_identifier_names

class CourseModuleResponse {
  final int? code;
  final bool? success;
  final Coursse? course;
  final List<CourseModule>? course_module;

  CourseModuleResponse({
    this.code,
    this.success,
    this.course,
    this.course_module,
  });

  CourseModuleResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        success = json['success'] as bool?,
        course = (json['course'] as Map<String,dynamic>?) != null ? Coursse.fromJson(json['course'] as Map<String,dynamic>) : null,
        course_module = (json['course_module'] as List?)
            ?.map((dynamic e) => CourseModule.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'success' : success,
    'course' : course?.toJson(),
    'course_module' : course_module?.map((e) => e.toJson()).toList()
  };
}

class Coursse {

  final int? crs_id;
  final String? crs_name;
  final String? crs_short_name;
  final String? crs_desc;
  final String? crs_amount;
  final String? crs_category;
  final String? crs_type;
  final String? course_time;
  final String? crs_image;


  Coursse({

    this.crs_id,
    this.crs_name,
    this.crs_short_name,
    this.crs_desc,
    this.crs_amount,
    this.crs_category,
    this.crs_type,
    this.course_time,
    this.crs_image,
  });

  Coursse.fromJson(Map<String, dynamic> json)
      :
        crs_id = json['crs_id'] as int?,
        crs_name = json['crs_name'] as String?,
        crs_short_name = json['crs_short_name'] as String?,
        crs_desc = json['crs_desc'] as String?,
        crs_amount = json['crs_amount'] as String?,
        crs_category = json['crs_category'].toString(),
        crs_type = json['crs_type'].toString(),
        course_time = json['course_time'].toString(),
        crs_image = json['crs_image'].toString();

  Map<String, dynamic> toJson() => {
    'crs_id' : crs_id,
    'crs_name' : crs_name,
    'crs_short_name' : crs_short_name,
    'crs_desc' : crs_desc,
    'crs_amount' : crs_amount,
    'crs_category' : crs_category,
    'crs_type ' : crs_type,
    'course_time ' : course_time,
    'crs_image ' : crs_image,
  };
}

class CourseModule {
  final MainModule? main_module;


  CourseModule({
    this.main_module,

  });

  CourseModule.fromJson(Map<String, dynamic> json, )
      : main_module = (json['main_module'] as Map<String,dynamic>?) != null ? MainModule.fromJson(json['main_module'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'main_module' : main_module?.toJson(),

  };
}

class MainModule {
  final int? module_id;
  final int? course_id;
  final int? parent_id;
  final String? module_title;
  final List<CoursePdf>? course_pdfs;
  final List<CourseVideos>? course_videos;
  final List<SubModule>? sub_module;

  MainModule({
    this.module_id,
    this.course_id,
    this.parent_id,
    this.module_title,
    this.course_pdfs,
    this.course_videos,
    this.sub_module,
  });

  MainModule.fromJson(Map<String, dynamic> json)
      :
        module_id = json['module_id'] as int?,
        course_id = json['course_id'] as int?,
        parent_id = json['parent_id'] as int?,
        module_title = json['module_title'] as String?,
        course_pdfs = (json['course_pdfs'] as List?)
            ?.map((dynamic e) => CoursePdf.fromJson(e as Map<String, dynamic>))
            .toList(),
        course_videos = (json['course_videos'] as List?)
            ?.map((dynamic e) => CourseVideos.fromJson(e as Map<String, dynamic>))
            .toList(),
        sub_module = (json['sub_module'] as List?)
            ?.map((dynamic e) => SubModule.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
    'module_id' : module_id,
    'course_id' : course_id,
    'parent_id' : parent_id,
    'module_title' : module_title,
    'course_pdfs' : course_pdfs?.map((e) => e.toJson()).toList(),
    'course_videos' : course_videos?.map((e) => e.toJson()).toList(),
    'sub_module' : sub_module?.map((e) => e.toJson()).toList(),
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

class SubModule{
  final int? module_id;
  final int? course_id;
  final int? parent_id;
  final String? module_title;
  final List<CoursePdf>? course_pdfs;
  final List<CourseVideos>? course_videos;



  SubModule({

    this.module_id,
    this.course_id,
    this.parent_id,
    this.module_title,
    this.course_pdfs,
    this.course_videos,


  });

  SubModule.fromJson(Map<String, dynamic> json)
      :
        module_id = json['module_id'] as int?,
        course_id = json['course_id'] as int?,
        parent_id = json['parent_id'] as int?,
        module_title = json['module_title'] as String?,
        course_pdfs = (json['course_pdfs'] as List?)
            ?.map((dynamic e) => CoursePdf.fromJson(e as Map<String, dynamic>))
            .toList(),
        course_videos = (json['course_videos'] as List?)
            ?.map((dynamic e) => CourseVideos.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {

    'module_id' : module_id,
    'course_id' : course_id,
    'parent_id' : parent_id,
    'module_title' : module_title,
    'course_pdfs' : course_pdfs?.map((e) => e.toJson()).toList(),
    'course_videos' : course_videos?.map((e) => e.toJson()).toList(),

  };
}
