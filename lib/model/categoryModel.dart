
import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.getMenuCategory,
  });

  List<GetMenuCategory> getMenuCategory;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    getMenuCategory: List<GetMenuCategory>.from(json["get_menu_category"].map((x) => GetMenuCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "get_menu_category": List<dynamic>.from(getMenuCategory.map((x) => x.toJson())),
  };
}

class GetMenuCategory {
  GetMenuCategory({
    this.id,
    this.name,
    this.slug,
  });

  int id;
  String name;
  String slug;

  factory GetMenuCategory.fromJson(Map<String, dynamic> json) => GetMenuCategory(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
  };
}
