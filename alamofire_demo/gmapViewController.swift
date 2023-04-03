import UIKit
import MapKit

class MyPointAnnotation : MKPointAnnotation {
    var pinTintColor: UIColor?
    var societyInfo: String?
    var sarveyBy : String?
    var sarveyDate : String?
    var societyVoter: Int?
    var societyNonVoter: Int?
    var societyRooms: Int?
    var societyLockRoom: Int?
    
}//sarveyDate,societyVoter,societyNonVoter,societyRooms,societyLockRoom



class gmapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
   
    @IBOutlet weak var zoomIN: UIButton!
    @IBOutlet weak var zoomOut: UIButton!
    
    let mumbaiAnnotation = MyPointAnnotation()
    let naviMumbaiAnnotation = MyPointAnnotation()
    let thaneAnnotation = MyPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        mapView.delegate = self
            
        if let path = Bundle.main.path(forResource: "SocietyListOfWard1", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [String: Any]
                
                if let societyList = json["societySummaryByWardNo"] as? [[String: Any]] {
                    // Do something with the array of dictionaries
                    print(societyList.count)
                    
                    for society in societyList {
                            guard let latitudeStr = society["Latitude"] as? String,
                                  let longitudeStr = society["Longitude"] as? String,
                                  let latitude = Double(latitudeStr),
                                  let longitude = Double(longitudeStr),
                                  let societyName = society["SocietyName"]as? String,
                                  let societyNameM = society["SocietyNameM"]as? String,
                                  let societyInfo = society["SocietyNameM"]as? String,
                                  let wardNoStr = society["Ward_No"] as? Int,
                                  let sarveyBy = society["Survey_UpdatedByUser"]as? String,
                                  let sarveyDate = society["Survey_UpdatedDate"]as? String,
                                  let societyVoter = society["Voter"] as? Int,
                                  let societyRooms = society["Rooms"] as? Int,
                                  let societyLockRoom = society["LockRoom"] as? Int,
                                  let societyNonVoter = society["NonVoter"] as? Int
                                   else {
                                continue
                            }
                        
                        let info = " Society Name: " + societyInfo + " SarveyBy: " + sarveyBy + " Sarvey Date: " + sarveyDate
                        //print(wardNoStr)//Survey_UpdatedByUser
                        let color_pin = pinColor(forWard: wardNoStr )
                        addAnnotation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), title: societyName, subtitle: societyNameM, pinTintColor: color_pin, societyInfo: societyInfo,sarveyBy: sarveyBy,sarveyDate:sarveyDate,societyVoter: societyVoter,societyNonVoter: societyNonVoter,societyRooms: societyRooms,societyLockRoom:societyLockRoom)

                    }//sarveyDate,societyVoter,societyNonVoter,societyRooms,societyLockRoom

                }
            } catch {
                print(error)
            }
        }

        
    
//
        // Set the visible region to show all the annotations
        let allAnnotations = mapView.annotations
        mapView.showAnnotations(allAnnotations, animated: true)
    }
    
    func pinColor(forWard ward: Int) -> UIColor {
        switch ward {
        case 1:
            return .red
        case 2:
            return .blue
        case 3:
            return .yellow
        case 4:
            return .purple
        case 5:
            return .orange
        case 6:
            return .darkGray
        case 7:
            return .magenta
        case 8:
            return .cyan
        
        default:
            return .green
        }
    }
    
    func addAnnotation(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, pinTintColor: UIColor?, societyInfo: String?, sarveyBy: String?, sarveyDate: String?,societyVoter: Int?,societyNonVoter: Int?,societyRooms: Int?,societyLockRoom: Int?) {
        let annotation = MyPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = subtitle
        annotation.pinTintColor = pinTintColor
        annotation.societyInfo = societyInfo
        annotation.sarveyBy = sarveyBy
        annotation.sarveyDate = sarveyDate
        annotation.societyVoter = societyVoter
        annotation.societyNonVoter = societyNonVoter
        annotation.societyRooms = societyRooms
        annotation.societyLockRoom = societyLockRoom
        mapView.addAnnotation(annotation)
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MyPointAnnotation else { return nil }
            
        let identifier = "marker"
        var view: MKMarkerAnnotationView
            
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

            
        }
            
        // Set the marker's color based on the annotation's `pinTintColor` property
        view.markerTintColor = annotation.pinTintColor
            
        return view
    }


    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation as? MyPointAnnotation else { return }

        let title = NSAttributedString(string: annotation.title ?? "", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        let societyInfo = NSAttributedString(string: "\nSociety Name: " + (annotation.societyInfo ?? ""), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        let sarveyBy = NSAttributedString(string: "\nSarveyBy: " + (annotation.sarveyBy ?? ""), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        let sarveyDate = NSAttributedString(string: "\nSarvey Date: " + (annotation.sarveyDate ?? ""), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        let societyVoter = NSAttributedString(string: "\nSociety Voter: " + String(annotation.societyVoter ?? 0), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        let societyNonVoter = NSAttributedString(string: "\nSociety Non-Voter: " + String(annotation.societyNonVoter ?? 0), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        let societyRooms = NSAttributedString(string: "\nSociety Rooms: " + String(annotation.societyRooms ?? 0), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        let societyLockRoom = NSAttributedString(string: "\nSociety Locked Rooms: " + String(annotation.societyLockRoom ?? 0), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        let message = NSMutableAttributedString()
        message.append(title)
        message.append(societyInfo)
        message.append(sarveyBy)
        message.append(sarveyDate)
        message.append(societyVoter)
        message.append(societyNonVoter)
        message.append(societyRooms)
        message.append(societyLockRoom)

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        message.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, message.length))

        alertController.setValue(message, forKey: "attributedMessage")

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        okAction.setValue(UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0), forKey: "titleTextColor")
        alertController.addAction(okAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        cancelAction.setValue(UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0), forKey: "titleTextColor")
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }

    
    

    
    @IBAction func zoomInFunc(_ sender: Any) {
        var region = mapView.region
        region.span.latitudeDelta /= 2
        region.span.longitudeDelta /= 2
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func zoomOutFunc(_ sender: Any) {
        var region = mapView.region
        region.span.latitudeDelta *= 2
        region.span.longitudeDelta *= 2
        mapView.setRegion(region, animated: true)
    }
}
