import Foundation

import CoreLocation

class LocationHelper : NSObject{
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.distanceFilter = 5 //5 meters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.startMonitoringSignificantLocationChanges()
//        let region = CLCircularRegion(center: .init(latitude: 48.858521842043345, longitude: 2.294513484541428), radius: 100, identifier: "Eifel Tower")
//
//        locationManager.startMonitoring(for: region)
        
        
//        let region = CLBeaconRegion(uuid: <#T##UUID#>, major: <#T##CLBeaconMajorValue#>, minor: <#T##CLBeaconMinorValue#>, identifier: <#T##String#>)
//
        locationManager.startMonitoringVisits() // you just add this and comment out the above (already commented out)
        
        
        
    }
    
    func askForInUsePermission(){
        locationManager.requestWhenInUseAuthorization()
    }
    
    func askForAlwaysPermission(){
        locationManager.requestAlwaysAuthorization()
    }
    
}


extension LocationHelper : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last
        print(lastLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
            print("Entered : \(region)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exited : \(region)")
    }
    
    
    
    //and you add this
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        
    }
    
}
