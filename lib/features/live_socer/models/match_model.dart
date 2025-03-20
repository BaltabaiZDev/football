
class MatchModel {
  final Fixture fixture;
  final League league;
  final Teams teams;
  final Goals goals;
  final Score score;

  MatchModel({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      fixture: Fixture.fromJson(json['fixture']),
      league: League.fromJson(json['league']),
      teams: Teams.fromJson(json['teams']),
      goals: Goals.fromJson(json['goals']),
      score: Score.fromJson(json['score']),
    );
  }
}

class Fixture {
  final int id;
  final String? referee;
  final String timezone;
  final String date;
  final int timestamp;
  final Periods periods;
  final Venue venue;
  final Status status;

  Fixture({
    required this.id,
    this.referee,
    required this.timezone,
    required this.date,
    required this.timestamp,
    required this.periods,
    required this.venue,
    required this.status,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
      id: json['id'],
      referee: json['referee'],
      timezone: json['timezone'] ?? 'UTC',
      date: json['date'] ?? '',
      timestamp: json['timestamp'] ?? 0,
      periods: Periods.fromJson(json['periods'] ?? {}),
      venue: Venue.fromJson(json['venue'] ?? {}),
      status: Status.fromJson(json['status'] ?? {}),
    );
  }
}

class Periods {
  final int? first;
  final int? second;

  Periods({this.first, this.second});

  factory Periods.fromJson(Map<String, dynamic> json) {
    return Periods(
      first: json['first'],
      second: json['second'],
    );
  }
}

class Venue {
  final dynamic id;
  final String name;
  final String city;

  Venue({
    required this.id,
    required this.name,
    required this.city,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['id'],
      name: json['name'] ?? 'Unknown Venue',
      city: json['city'] ?? 'Unknown City',
    );
  }
}

class Status {
  final String long;
  final String short;
  final int? elapsed;
  final int? extra;

  Status({
    required this.long,
    required this.short,
    this.elapsed,
    this.extra,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      long: json['long'] ?? '',
      short: json['short'] ?? '',
      elapsed: json['elapsed'],
      extra: json['extra'],
    );
  }
}

class League {
  final int id;
  final String name;
  final String country;
  final String logo;
  final String flag;
  final int season;
  final String round;
  final bool standings;

  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.round,
    required this.standings,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['id'],
      name: json['name'] ?? '',
      country: json['country'] ?? '',
      logo: json['logo'] ?? '',
      flag: json['flag'] ?? '',
      season: json['season'] ?? 0,
      round: json['round'] ?? '',
      standings: json['standings'] ?? false,
    );
  }
}

class Teams {
  final Team home;
  final Team away;

  Teams({required this.home, required this.away});

  factory Teams.fromJson(Map<String, dynamic> json) {
    return Teams(
      home: Team.fromJson(json['home'] ?? {}),
      away: Team.fromJson(json['away'] ?? {}),
    );
  }
}

class Team {
  final int id;
  final String name;
  final String logo;
  final bool winner;

  Team({
    required this.id,
    required this.name,
    required this.logo,
    required this.winner,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      winner: json['winner'] ?? false,
    );
  }
}

class Goals {
  final int? home;
  final int? away;

  Goals({this.home, this.away});

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      home: json['home'],
      away: json['away'],
    );
  }
}

class Score {
  final ScoreDetail halftime;
  final ScoreDetail fulltime;
  final ScoreDetail extratime;
  final ScoreDetail penalty;

  Score({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      halftime: ScoreDetail.fromJson(json['halftime'] ?? {}),
      fulltime: ScoreDetail.fromJson(json['fulltime'] ?? {}),
      extratime: ScoreDetail.fromJson(json['extratime'] ?? {}),
      penalty: ScoreDetail.fromJson(json['penalty'] ?? {}),
    );
  }
}

class ScoreDetail {
  final int? home;
  final int? away;

  ScoreDetail({this.home, this.away});

  factory ScoreDetail.fromJson(Map<String, dynamic> json) {
    return ScoreDetail(
      home: json['home'],
      away: json['away'],
    );
  }
}
