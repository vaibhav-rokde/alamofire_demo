import UIKit
import DropDown

class FormViewController: UIViewController{
    
    
    let apiService = TreeCensusAPIService()
    
    @IBOutlet weak var LocalName: UITextField!
    @IBOutlet weak var ScientificName: UITextField!
    //@IBOutlet weak var Specie: UITextField!
    @IBOutlet weak var Discription: UITextField!
    @IBOutlet weak var Remark: UITextField!
    @IBOutlet weak var Submit: UIButton!
    
    
    
    @IBOutlet weak var testDropDownButton: UIButton!
    let dropDown = DropDown()

    // The view to which the drop down will appear on
    
    var dropdownList: [allSpecie] = []
    var s = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDown.anchorView = testDropDownButton
        dropdownLST()
        
        
        
        
    }
    
    @IBAction func testDropDownFuncOption(_ sender: Any) {
        
        let dvalues = self.dropdownList.map { $0.Dvalue }
        dropDown.dataSource = dvalues
        dropDown.direction = .bottom
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                    
            testDropDownButton.setTitle(item, for: .normal)
            s = item
            print(s)
                }
        dropDown.show()
        
        print(testDropDownButton.currentTitle)
    }
    
    
    
    func dropdownLST(){
        apiService.getDropdownTreeData(appName: "TreeCensus", electionName: "NMMC", userName: "BHUSHAN_P20", designation: "Software Developer", operation: "dropdown") { result in
            switch result {
            case .success(let dropdownjson):
                print(dropdownjson)
                do {
                    let dropdownjsonData = try JSONSerialization.data(withJSONObject: dropdownjson, options: [])
                    let dropdowndecoder = JSONDecoder()
                    let dropdownRes = try dropdowndecoder.decode(dropdownResponse.self, from: dropdownjsonData)
                    
                    self.dropdownList = dropdownRes.SpecieList

                    print(self.dropdownList.count)
                    
                    
                    
                } catch {
                    print("Error decoding JSON: \(error)")
                }
                
            case .failure(let error):
                print(error)
                // Handle the error here
            }
        }
    }
    
    @IBAction func Submit(_ sender: Any) {
        // Check if any of the text fields are empty
        guard let localName = LocalName.text, !localName.isEmpty,
              let scientificName = ScientificName.text, !scientificName.isEmpty,
              
              let description = Discription.text, !description.isEmpty,
              let remark = Remark.text, !remark.isEmpty,
              s != "" else {
            // Show an alert if any of the text fields are empty
            print("error")
            let alert = UIAlertController(title: "Error", message: "Please fill in all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        // All text fields are filled, print a message to the console and proceed with submitting the form data to the server
        print("All text fields are filled and ready to go!")
        
        // TODO: Submit the form data to the server
        
        apiService.addTreeData(appName: "TreeCensus", electionName: "NMMC", userName: "BHUSHAN_P20", designation: "Software Developer", operation: "insert", LocalName: localName, ScientificName: scientificName, Specie: s,Description: description,Remark: remark) { result in
            switch result {
            case .success(let json):
                print(json)
                
                
                
               
            case .failure(let error):
                print(error)
                // Handle the error here
            }
        }
        
        
        
        // Show a success message to the user
        let alert = UIAlertController(title: "Success", message: "Form submitted successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        
        // Reset all text fields
        LocalName.text = ""
        ScientificName.text = ""
        //Specie.text = ""
        Discription.text = ""
        Remark.text = ""
    }
}




    
