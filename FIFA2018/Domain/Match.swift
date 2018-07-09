struct Match: Decodable {
    let stage_name: String
    let status: String
    let home_team: Team
    let away_team: Team
    let datetime: String
    let winner: String?
    let venue: String
    let location: String
}

struct Team: Decodable {
    let country: String
    let code: String
    let goals: Int?
    let penalties: Int?
}
