class CategoriesModel
{
  bool status;
  CategoriesDataModel data;

  CategoriesModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    data = json['data'] != null ? CategoriesDataModel.fromJson(json['data']) : null;
  }
}

class CategoriesDataModel
{
  int currentPage;
  List<CategoriesDataDetailsModel> data = [];

  CategoriesDataModel.fromJson(Map<String, dynamic> json)
  {
    currentPage = json['current_page'];
    json['data'].forEach((element)
    {
      data.add(CategoriesDataDetailsModel.fromJson(element));
    });
  }
}

class CategoriesDataDetailsModel
{
  int id;
  String name;
  String image;

  CategoriesDataDetailsModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}

