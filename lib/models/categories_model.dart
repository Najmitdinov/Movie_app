class CategoriesModel {
  final String id;
  final String title;

  CategoriesModel({
    required this.id,
    required this.title,
  });
}

class CategoriesMovie {
  final List<CategoriesModel> _categories = [
    CategoriesModel(id: 'c1', title: 'Action'),
    CategoriesModel(id: 'c2', title: 'DC Studio'),
    CategoriesModel(id: 'c3', title: 'Marvel Studio'),
    CategoriesModel(id: 'c4', title: 'Horror'),
  ];

  List<CategoriesModel> get categoriesList {
    return _categories;
  }
}
