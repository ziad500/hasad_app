class ListsModel {
  bool? status;
  String? message;
  List<ListsDataModel>? data;

  ListsModel(this.status, this.message, this.data);
}

class ListsDataModel {
  int? id;
  String? name;
  String? image;

  ListsDataModel(this.id, this.name, this.image);
}
