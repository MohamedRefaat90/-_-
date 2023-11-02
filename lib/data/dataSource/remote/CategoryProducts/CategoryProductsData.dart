import 'package:ecommerce/ApiLinks.dart';
import 'package:ecommerce/core/class/DB_helper.dart';

class CategoryProductsData {
  DB_helper db_helper;
  CategoryProductsData(this.db_helper);

  getCategoryProductsData(
      {required String categoryID,
      double? minPrice,
      double? maxPrice,
      String? sort,
      String? sortBy,
      int? page,
      int? limit,
      String? userToken}) async {
    var response = await db_helper.getAllData(
        "${ApiLinks.getProducts}?categoryId=$categoryID&minPrice=$minPrice&maxPrice=$maxPrice&sort=$sort&sortBy=$sortBy&page=$page&limit=$limit",
        userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }
}
