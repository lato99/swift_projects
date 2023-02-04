import UIKit
import MapKit

class DetailViewController: UIViewController {


    @IBOutlet weak var imageView: UIImageView!
    
    var weatherId : String? = ""
    
    @IBOutlet weak var mapView: MKMapView!
    let locationHelper = LocationHelper()  //add this
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //add the viewDidAppear function
    override func viewDidAppear(_ animated: Bool) {
        //locationHelper.askForInUsePermission()
        locationHelper.askForAlwaysPermission()
        
        let region = MKCoordinateRegion(center: .init(latitude: 48.858521842043345, longitude: 2.294513484541428), latitudinalMeters: 1000, longitudinalMeters: 1000) //
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.mapView.setRegion(region, animated: true)
            
        }
        
        // add ping to the map - in a for loop, add annotations - use array and get annotation from there
        let annotation = MKPointAnnotation()
        annotation.coordinate = .init(latitude: 48.858521842043345, longitude: 2.294513484541428)
        annotation.title = "Eifel Tower"
        mapView.addAnnotation(annotation)
        
    
    }

    @IBAction func selectImage(_ sender: Any) {        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true //if you dont want to edit image delete this
        self.present(imagePickerController, animated: true)
        
    }
    
}

//this is for after adding delegate, know that it clicked on the pin


extension DetailViewController : MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.title)
    }
}




extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {  //if you don't want editing, turn this to .originalImage
            self.imageView.image = image
            let userDefault = UserDefaults.standard// delete this if you just want image picker
            
            
            
        }
        self.dismiss(animated: true)
    }
}
