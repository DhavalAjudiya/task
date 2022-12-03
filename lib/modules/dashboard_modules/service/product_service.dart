import 'package:task/helper/network_helper.dart';
import 'package:task/modules/dashboard_modules/modal/product_modal.dart';
import 'package:task/res/appconfig.dart';

class ProductService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future<ProductModal> getProductData() async {
    try {
      final response = await _networkAPICall.get(
        AppConfig.productUrl,
      );
      return ProductModal.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
