import 'package:bloc/bloc.dart';
import 'package:undefeats/data/net/get_matches_list.dart';
import 'package:undefeats/data/parse/parse_matches_list.dart';
/*
Cubit to cal future of fetch matchesList from API
 */
class MatchesListCubit extends Cubit<MatchesList> {
  final _matchesList = GetMatchesList();

  MatchesListCubit() : super(MatchesList([]));

  void getMatchListInCubit() async => emit( await _matchesList.getMatchesListFromApi()  );
}
