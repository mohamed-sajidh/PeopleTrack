import 'package:peopletrack/core/utils/config.dart';
import 'package:peopletrack/core/utils/dio_client.dart';
import 'package:peopletrack/models/personal_details_model.dart';

class PersonalDetailsServices {
  static Future<List<PersonalDetailsModel>> getPersonalDetails() async {
    final dio = await DioClient().getAuthorizedDio();

    final personalDetailsEndPoint =
        '${ApiConfig.baseUrl}/api/personnel-details/';

    final response = await dio.get(
      personalDetailsEndPoint,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> personalDetailsJson = jsonData["data"];

      if (jsonData["status"] == true) {
        List<PersonalDetailsModel> personalDetailsList = personalDetailsJson
            .map((json) => PersonalDetailsModel.fromJson(json))
            .toList();

        return personalDetailsList;
      } else {
        throw Exception('Error: ${jsonData["message"]}');
      }
    } else {
      throw Exception('Failed to load Personal Details');
    }
  }
}
