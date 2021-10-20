class ModelHttpError {
  String? status, message;
  List<dynamic>? errors;

  ModelHttpError({this.status, this.message, this.errors});

  ModelHttpError.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
  }
}
