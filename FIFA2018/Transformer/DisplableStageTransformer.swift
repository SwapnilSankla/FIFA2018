import Foundation

class DisplableStageTransformer {
    func transform(matches: [Match]) -> [DisplableStage] {
        var matchStages = [String]()
        matches.forEach { (match) in
            if !matchStages.contains(match.stage_name) {
                matchStages.append(match.stage_name)
            }
        }

        var schedule = [DisplableStage]()
        matchStages.forEach { (stage) in

            let matchingMatches = matches.filter({ (match) -> Bool in
                match.stage_name == stage
            })

            let displayableMatches = matchingMatches.map { (match) -> DisplableMatch in
                let team1 = getDisplayableTeam(team: match.home_team)
                let team2 = getDisplayableTeam(team: match.away_team)
                return DisplableMatch(location: match.venue + " " + match.location,
                                      status: match.status,
                                      team1: team1,
                                      team2: team2,
                                      formattedDateTime: getFormattedDate(from: match.datetime),
                                      score: score(match),
                                      winner: winner(match))
            }


            schedule.append(DisplableStage(name: stage,
                                           matches: displayableMatches))
        }
        return schedule
    }

    private func score(_ match: Match) -> Score {
        switch match.winner {
        case nil:
            return Score.TBD
        case match.home_team.country, match.away_team.country:
            if let homeTeamPenalties = match.home_team.penalties,
               let awayTeamPenalties = match.away_team.penalties {
                if homeTeamPenalties != 0 && awayTeamPenalties != 0 {
                    return Score.score("\(homeTeamPenalties)-\(awayTeamPenalties) (P)")
                }
            }
            return Score.score("\(match.home_team.goals!)-\(match.away_team.goals!)")
        default:
            return Score.score("\(match.home_team.goals!)-\(match.away_team.goals!)")
        }
    }

    private func winner(_ match: Match) -> Winner {
        switch match.winner {
        case nil:
            return Winner.TBD
        case match.home_team.country:
            return Winner.Team1
        case match.away_team.country:
            return Winner.Team2
        default:
            return Winner.Draw
        }
    }

    private func getDisplayableTeam(team: Team) -> String {
        return team.code == "TBD" ? "TBD" : team.country
    }

    private func getFormattedDate(from date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let actualDate = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "d MMM yy, h:mm a"
        guard let unwrappedActualDate = actualDate else {
            return ""
        }
        return dateFormatter.string(from: unwrappedActualDate)
    }
}
