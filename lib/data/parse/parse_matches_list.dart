/*
parse Matches to get matches which list of Maps
 */

class MatchesList{
  final List matches;

  MatchesList(this.matches);

  factory MatchesList.fromJson(Map<String,dynamic> json){
    return MatchesList(json['matches'] );
  }
}