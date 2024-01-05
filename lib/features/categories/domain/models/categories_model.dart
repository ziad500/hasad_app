class CategoriesModel {
  bool? status;
  String? message;
  List<CategoryListModel>? data;

  CategoriesModel(this.status, this.message, this.data);
}

class CategoryListModel {
  num? id;
  String? name;
  String? image;
  CategoryListModel(
    this.id,
    this.name,
    this.image,
  );
}
