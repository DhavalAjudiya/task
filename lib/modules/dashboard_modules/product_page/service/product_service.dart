import 'package:task/helper/network_helper.dart';
import 'package:task/modules/dashboard_modules/product_page/modal/product_modal.dart';
import 'package:task/res/appconfig.dart';

class ProductService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future<ProductModal> getProductData(int select) async {
    try {
      final response = await _networkAPICall.get(
        "${AppConfig.productUrl}$select${AppConfig.productUrl1}",
      );
      return ProductModal.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
