import 'package:coin_currency/config/constants/strings.dart';
import 'package:coin_currency/data/models/currency_model/currency_view_model.dart';
import 'package:coin_currency/utils/parse_currencies_xml_data.dart';
import 'package:fimber/fimber.dart';
import 'package:http/http.dart';

class ServerRepository {
  final cl = Client();

  //Get Currencies Data
  Future<List<CurrencyViewModel>> getCurrencies(String? date) async {
    final response = await cl.get(_getParsedUri("/$date.xml"));

    if (response.successResponse) {
      Fimber.e('Fetched currency items successfully 🤑');
      final currencies = ParseCurrenciesXMLData.parseCurrenciesXML(response);
      return currencies;
    } else {
      Fimber.e('Problem occured while fetching currency items 😥');
      return [];
    }
  }

  Uri _getParsedUri(String route, [Map<String, dynamic>? params]) {
    return Uri.parse('${AppStrings.apiHost}$route')
        .replace(queryParameters: params);
  }
}

extension ResponseExtension on Response {
  bool get successResponse => statusCode >= 200 && statusCode < 300;
}
