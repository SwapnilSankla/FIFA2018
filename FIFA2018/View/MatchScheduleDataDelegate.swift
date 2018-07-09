import UIKit

class MatchScheduleDataDelegate: NSObject, UITableViewDelegate {
    var didSelectRowAt: ((Int) -> Void)?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAt?(indexPath.row)
    }
}
