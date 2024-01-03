class ListsModel {
  bool? status;
  String? message;
  List<ListsDataModel>? data;

  ListsModel(this.status, this.message, this.data);
}

class ListsDataModel {
  int? id;
  String? name;

  ListsDataModel(this.id, this.name);
}
