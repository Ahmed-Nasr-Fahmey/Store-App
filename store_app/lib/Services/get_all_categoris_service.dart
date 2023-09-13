
import '../Helper/api.dart';

class GetAllCategorisService {
  Future<List<dynamic>> getAllCategoris() async {
    List<dynamic> data =
        await API.get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
