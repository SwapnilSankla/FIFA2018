import UIKit
import MapKit

class LocationViewController: UIViewController {
    var location: String?

    override func viewDidLoad() {
        let map = MKMapView(frame: view.frame)
        let location = CLLocation(latitude: 46.73060199999999753117663203738629817962646484375,
                                  longitude: -116.998997000000002799424692057073116302490234375)
        let regionRadius: CLLocationDistance = 5000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        map.setRegion(coordinateRegion, animated: true)

        view.addSubview(map)
    }
}

