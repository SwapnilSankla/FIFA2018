import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        let viewController = WorldCupMatchesListViewController(nibName: nil, bundle: nil)
//        let viewController = LocationViewController(nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

