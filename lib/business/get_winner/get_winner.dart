/* There 3 conditions 1. homeTeam wins, 2. awayTeam wins or 3.DRAW.
it calculates football scores for each one and select the most winner.
get data out of MatchListApi */

import 'package:undefeats/data/parse/parse_matches_list.dart';

class GetWinner {
  MatchesList response;

  GetWinner(this.response);

  String getWinner() {
    Map<String, int> winners = {};
    for (int i = 0; i < response.matches.length; i++) {
      if (response.matches[i]['score']['winner'] == 'HOME_TEAM') {
        if (winners[response.matches[i]['homeTeam']['name']] != null) {
          winners.update(response.matches[i]['homeTeam']['name'],
              (value) => value = value + 3);
        } else {
          winners[response.matches[i]['homeTeam']['name']] = 3;
        }
      } else if (response.matches[i]['score']['winner'] == 'AWAY_TEAM') {
        if (winners[response.matches[i]['awayTeam']['name']] != null) {
          winners.update(response.matches[i]['awayTeam']['name'],
              (value) => value = value + 3);
        } else {
          winners[response.matches[i]['awayTeam']['name']] = 3;
        }
      } else if (response.matches[i]['score']['winner'] == 'DRAW') {
        if (winners[response.matches[i]['awayTeam']['name']] != null) {
          winners.update(response.matches[i]['awayTeam']['name'],
              (value) => value = value + 1);
        } else {
          winners[response.matches[i]['awayTeam']['name']] = 1;
        }

        if (winners[response.matches[i]['homeTeam']['name']] != null) {
          winners.update(response.matches[i]['homeTeam']['name'],
              (value) => value = value + 1);
        } else {
          winners[response.matches[i]['homeTeam']['name']] = 1;
        }
      }
    }
    var mapEntries = winners.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    winners
      ..clear()
      ..addEntries(mapEntries);

    return winners.keys.last;
  }
}
