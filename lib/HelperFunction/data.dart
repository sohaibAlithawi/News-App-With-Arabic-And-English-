import 'package:news_app_api/Model/CategoryModel.dart';

List<CategoryModel> getCategoryModel() {
  List <CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //TODO: 1
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
  "https://media.istockphoto.com/photos/businessman-receive-counseling-from-colleague-it-is-a-picture-of-the-picture-id1271491361?b=1&k=20&m=1271491361&s=170667a&w=0&h=h3GU6-TmUtsqOfqoVpgYpxt3rO-Rx66kWLCOpymW5wI=";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //TODO: 2
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1614294149010-950b698f72c0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGVudGVydGFpbm1lbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);
  categoryModel = new CategoryModel();


  //TODO: 3
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2VuZXJhbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //TODO: 4
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
  "https://media.istockphoto.com/photos/two-men-exercising-picture-id1293388093?b=1&k=20&m=1293388093&s=170667a&w=0&h=zToDtkVlVxFCO-w0SbtvAHML71GNiJKCfX09FBlof3g=";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //TODO: 5
  categoryModel.categoryName = "Sport";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1483721310020-03333e577078?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8c3BvcnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //TODO: 6
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}