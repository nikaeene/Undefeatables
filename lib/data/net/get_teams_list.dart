import 'dart:convert';
import 'package:undefeats/data/constants/constants.dart';
import 'package:http/http.dart' as http;
import '../parse/parse_teams_list.dart';

/* request Data from Api with a header which is auth token. Token is in contants.
* it returns teams which is List of Maps */
class GetTeamsList {
  String query;

  GetTeamsList(this.query);

  Future<TeamsList> getTeamsListFromApi() async {
    final uri = Uri.https(Constants.baseUriAPI, query);
    try {
      final response = await http.get(uri, headers: {
        Constants.tokenName: Constants.apiToken,
      });
      final json = jsonDecode(response.body);
      return TeamsList.fromJson(json);
    } catch(error) {
      rethrow;
    }
  }
}
