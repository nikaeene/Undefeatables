import 'package:bloc/bloc.dart';
import 'package:undefeats/data/constants/constants.dart';
import 'package:undefeats/data/net/get_teams_list.dart';
import 'package:undefeats/data/parse/parse_teams_list.dart';
/*
Cubit of future get TeamList from API
 */
class TeamsListCubit extends Cubit<TeamsList> {
  TeamsListCubit() : super(TeamsList([]));
  final _teamsList = GetTeamsList(Constants.teamsUri);

  void getTeamsListInCubit() async =>
      emit(await _teamsList.getTeamsListFromApi());
}
