import 'package:softagi_2021/models/shop_app/home_model.dart';

class FavoritesModel {
  bool status;
  Data data;

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int currentPage;
  List<FavoritesData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<FavoritesData>();
      json['data'].forEach((v) {
        data.add(new FavoritesData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class FavoritesData {
  int id;
  ProductsModel product;

  FavoritesData({
    this.id,
    this.product,
  });

  FavoritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'] != null
        ? new ProductsModel.fromJson(json['product'])
        : null;
  }
}
