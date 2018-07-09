import UIKit

class MatchScheduleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var winner1: UILabel!
    @IBOutlet weak var winner2: UILabel!

    func configure(schedule: DisplableMatch) {

        if schedule.status == "completed" {
            backgroundColor = UIColor(red: 174/255, green: 249/255, blue: 181/255, alpha: 1.0)
        } else {
            backgroundColor = UIColor.white
        }

        team1.text = schedule.team1
        team2.text = schedule.team2
        dateTime.text = schedule.formattedDateTime
        switch schedule.score {
        case .score(let string):
            result.text = string
        case .TBD:
            result.text = "TBD"
        }

        switch schedule.winner {
        case .Draw, .TBD:
            winner1.isHidden = true
            winner2.isHidden = true
            break
        case .Team1:
            winner1.isHidden = false
            winner2.isHidden = true
        case .Team2:
            winner1.isHidden = true
            winner2.isHidden = false
        }
    }
}
