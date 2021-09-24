
/*
pass in teamList of TeamList as TeamList which contains of details and compare it with name of winner and get detailes of winner.
 */
import 'package:undefeats/data/parse/parse_teams_list.dart';

 class GetWinnerDetails {
  TeamsList response;
  String winner;

  GetWinnerDetails(this.response, this.winner);

  Map getWinnerDetails() {
    Map winnerDetails = {};
    for (int i = 0; i < response.teams.length; i++) {
      if (response.teams[i]['name'] == winner) winnerDetails = response.teams[i];
    }
    return winnerDetails;
  }
}
