class SliderModel {
  bool? status;
  String? message;
  List<SliderDataModel>? data;

  SliderModel(this.message, this.status, this.data);
}

class SliderDataModel {
  int? id;
  String? path;

  SliderDataModel(this.id, this.path);
}
