import Foundation
import RxSwift
import Swift_SimpleNetworkLibrary

class WorldCupMatchesPresenter {
    weak var view: MatchScheduleViewProtocol?
    var schedule: [DisplableStage]?
    var disposeBag = DisposeBag()
    let networkLayer = NetworkLayerRx<[Match]>()
    
    init(view: MatchScheduleViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        NetworkLayer().get(urlString: "http://worldcup.sfg.io/matches",
                           successHandler: dataReceived,
                           errorHandler: dataFailedToReceive)
    }
    func dataReceived(matches: [Match]) {
        self.schedule = DisplableStageTransformer().transform(matches: matches)
        view?.setSchedule(schedule: schedule!)
    }
    
    func dataFailedToReceive(error: String) {
        print(error)
    }

    func didSelectMatchAt(index: Int) {
        let viewController = LocationViewController()
        viewController.location = schedule?[index].matches[index].location
        view?.navigateTo(viewController: viewController)
    }
}
