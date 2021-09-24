class FetchWinnerDetails{
  Map winnerDetails;
  FetchWinnerDetails(this.winnerDetails);

  String get name =>  winnerDetails['name'];
  String get shortName => winnerDetails['shortName'];
  String get logo =>   winnerDetails['crestUrl'];
  String get address => winnerDetails['address'];
  String get phone => winnerDetails['phone'];
  String get website => winnerDetails['website'];
  String get email => winnerDetails['email'];
  String get founded => winnerDetails['founded'];
  String get clubColors => winnerDetails['clubColors'];
  String get venue => winnerDetails['venue'];
}