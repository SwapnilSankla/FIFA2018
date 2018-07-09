import UIKit

protocol MatchScheduleViewProtocol: class {
    func navigateTo(viewController: UIViewController)
    func setSchedule(schedule: [DisplableStage])
}
