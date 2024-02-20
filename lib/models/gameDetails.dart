class GameDetails {
  final String sport;
  final String ground;
  final String address;
  final DateTime date;
  final int playerCount;
  final int durationHour;
  final int durationMinute;
  final List players;

  GameDetails(
      {required this.ground,
      required this.address,
      required this.players,
      required this.sport,
      required this.date,
      required this.playerCount,
      required this.durationHour,
      required this.durationMinute});
}
