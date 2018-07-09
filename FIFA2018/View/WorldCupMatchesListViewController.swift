import UIKit

class WorldCupMatchesListViewController: UITableViewController {
    var dataSource: MatchScheduleTableViewDataSource?
    var delegate: MatchScheduleDataDelegate?
    var presenter: WorldCupMatchesPresenter?

    override func viewDidLoad() {
        presenter = WorldCupMatchesPresenter(view: self)
        presenter?.viewDidLoad()
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MatchScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchScheduleTableViewCell")
    }

    func didSelectMatchAt(index: Int) {
        presenter?.didSelectMatchAt(index: index)
    }
 }

extension WorldCupMatchesListViewController: MatchScheduleViewProtocol {
    func setSchedule(schedule: [DisplableStage]) {
        DispatchQueue.main.async {
            self.dataSource = MatchScheduleTableViewDataSource(schedule: schedule)
            self.delegate = MatchScheduleDataDelegate()
            self.delegate?.didSelectRowAt = self.didSelectMatchAt
            self.tableView.delegate = self.delegate
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }

    func navigateTo(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

