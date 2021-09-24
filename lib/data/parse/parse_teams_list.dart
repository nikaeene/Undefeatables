/*
parse Teams list to get teams which id list of Maps
 */
class TeamsList {
  final List teams;

  TeamsList(this.teams);

  factory TeamsList.fromJson(Map<String, dynamic> json) {
    return TeamsList(json['teams']);
  }
}
