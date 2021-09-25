import 'dart:convert';
import 'package:undefeats/business/date/set_dates.dart';
import 'package:undefeats/data/constants/constants.dart';
import 'package:undefeats/data/parse/parse_matches_list.dart';
import 'package:http/http.dart' as http;

/* get data from API by http parse it by parse_match_list and output MATCHES.
 Matches is List of Maps. it won't get unfinished matches.*/
class GetMatchesList {
  List dates = SetDates().setThirtyDays();

  Future<MatchesList> getMatchesListFromApi() async {
    final uri = Uri.https(Constants.baseUriAPI, Constants.matchesUri,
        {'status': 'FINISHED', 'dateFrom': dates[1], 'dateTo': dates[0]});
    try {
      final response = await http.get(uri, headers: {
        Constants.tokenName: Constants.apiToken,
      }).catchError((error){
        return error;
      });
      final json = jsonDecode(response.body);

      return MatchesList.fromJson(json);

    } on Error {
      Error error = ArgumentError('oh!');
      throw error;
    }
  }
}
