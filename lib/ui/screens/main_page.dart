import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:undefeats/business/get_winner/get_winner.dart';
import 'package:undefeats/business/get_winner_details/get_winner_details.dart';
import 'package:undefeats/business/matches_list_bloc/matches_list_cubit.dart';
import 'package:undefeats/business/teams_list_bloc/teams_list_cubit.dart';
import 'package:undefeats/data/parse/parse_matches_list.dart';
import 'package:undefeats/data/parse/parse_teams_list.dart';
import 'package:undefeats/ui/screens/vertical_screen.dart';

import 'horizantal_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Map details = {};
  String winner = '';
  final String title = 'An Awesome Task';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MatchesListCubit>(
          create: (context) => MatchesListCubit()..getMatchListInCubit(),
        ),
        BlocProvider<TeamsListCubit>(
          create: (context) => TeamsListCubit()..getTeamsListInCubit(),
        ),
      ],
      child:
      BlocBuilder<MatchesListCubit, MatchesList>(builder: (context, state) {
        if (state.matches.isNotEmpty) {
          winner = GetWinner(state).getWinner();
        }
        return BlocBuilder<TeamsListCubit, TeamsList>(
            builder: (context, state) {
              if (state.teams.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              details =
                  GetWinnerDetails(state, winner).getWinnerDetails();

              if (details.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Scaffold(
                  appBar: AppBar(
                    title: Text(title),
                  ),
                  body:  LayoutBuilder(builder: (context, constrains) {
                    if (constrains.maxWidth < 600) {
                      return VerticalScreen(constrains, details);
                    }else{
                      return HorizantalScreen(constrains, details);
                    }}));

            });
      }),
    );
  }
  }

