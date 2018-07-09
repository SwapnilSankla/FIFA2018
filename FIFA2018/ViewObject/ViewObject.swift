struct DisplableStage {
    let name: String
    let matches: [DisplableMatch]
}

struct DisplableMatch {
    let location: String
    let status: String
    let team1: String
    let team2: String
    let formattedDateTime: String
    let score: Score
    let winner: Winner
}

enum Winner {
    case Team1
    case Team2
    case Draw
    case TBD
}

enum Score {
    case score(String)
    case TBD
}
