import '../../features/live_socer/models/match_model.dart';

MatchModel createDummyMatch() {
  return MatchModel(
    fixture: Fixture(
      id: 0,
      referee: null,
      timezone: '',
      date: '',
      timestamp: 0,
      periods: Periods(first: null, second: null),
      venue: Venue(
        id: null,
        name: '',
        city: '',
      ),
      status: Status(
        long: '',
        short: '',
        elapsed: null,
        extra: null,
      ),
    ),
    league: League(
      id: 0,
      name: '',
      country: '',
      logo: '',
      flag: '',
      season: 0,
      round: '',
      standings: false,
    ),
    teams: Teams(
      home: Team(
        id: 0,
        name: '',
        logo: '',
        winner: false,
      ),
      away: Team(
        id: 0,
        name: '',
        logo: '',
        winner: false,
      ),
    ),
    goals: Goals(
      home: 1,
      away: 2,
    ),
    score: Score(
      halftime: ScoreDetail(home: null, away: null),
      fulltime: ScoreDetail(home: null, away: null),
      extratime: ScoreDetail(home: null, away: null),
      penalty: ScoreDetail(home: null, away: null),
    ),
  );
}
