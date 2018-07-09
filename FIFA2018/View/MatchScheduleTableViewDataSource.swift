import UIKit

class MatchScheduleTableViewDataSource: NSObject, UITableViewDataSource {
    let schedule: [DisplableStage]

    init(schedule: [DisplableStage]) {
        self.schedule = schedule
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return schedule.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return schedule[section].name
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule[section].matches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchScheduleTableViewCell",
                                                 for: indexPath)
        if let cell = cell as? MatchScheduleTableViewCell {
            cell.configure(schedule: schedule[indexPath.section].matches[indexPath.row])
        }
        return cell
    }
}
