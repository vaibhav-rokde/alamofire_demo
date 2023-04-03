//
//  treeContent.swift
//  alamofire_demo
//
//  Created by orenet on 13/03/23.
//

import UIKit

class treeContent: UIViewController {

    let apiService = TreeCensusAPIService()
    @IBOutlet weak var LocalName: UITextField!
    
    @IBOutlet weak var ScientificName: UITextField!
    
    @IBOutlet weak var Specie: UITextField!
    
    @IBOutlet weak var Discription: UITextField!
    
    @IBOutlet weak var Remark: UITextField!
    
    @IBOutlet weak var edit: UIButton!
    
    
    //@IBOutlet weak var deleteTree: UIButton!
    
    
    var tree: Tree = Tree(TreeCd: 0, LocalName: "", ScientificName: "", Specie: "", Description: "", IsActive: 0, AddedBy: "", AddedDate: "", UpdatedBy: "", UpdatedDate: "", Remark: "", DeActiveDate: "")


    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //treeName.text = tree.LocalName
        LocalName.text = tree.LocalName
        ScientificName.text = tree.ScientificName
        Specie.text = tree.Specie
        Discription.text = tree.Description
        Remark.text = tree.Remark
        
        
    }
    
    
    @IBAction func edit(_ sender: Any) {
        
        let alert = UIAlertController(title: "Warning", message: "Are you sure you want to proceed with the edit?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
        alert.addAction(UIAlertAction(title: "Proceed", style: .default, handler: { [self] action in
                print("Go to edit")
                
                guard let localName = self.LocalName.text, !localName.isEmpty,
                      let scientificName = self.ScientificName.text, !scientificName.isEmpty,
                      let specie = Specie.text, !specie.isEmpty,
                      let description = self.Discription.text, !description.isEmpty,
                      let remark = self.Remark.text, !remark.isEmpty else {
                    // Show an alert if any of the text fields are empty
                    print("error")
                    let alert = UIAlertController(title: "Error", message: "Please fill in all fields", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    present(alert, animated: true)
                    return
                }
            
            let TreeCdd: Int = tree.TreeCd ?? 0
            print(TreeCdd)
            apiService.editTreeData(appName: "TreeCensus", electionName: "NMMC", userName: "BHUSHAN_P20", designation: "Software Developer", operation: "insert", LocalName: localName, ScientificName: scientificName, Specie: specie,Description: description,Remark: remark, TreeCd: TreeCdd ) { result in
                switch result {
                case .success(let json):
                    print(json)
                    // Show a success message to the user
                   
                    
                    DispatchQueue.main.async {
                                            self.navigationController?.popViewController(animated: true)
                                            if let previousVC = self.navigationController?.viewControllers.last as? ViewController {
                                                previousVC.refreshData()
                                            }
                    }
                    
                   
                case .failure(let error):
                    print(error)
                    // Handle the error here
                }
            }
                
            }))
            
            present(alert, animated: true, completion: nil)
    }
    
    
//    @IBAction func deleteTree(_ sender: Any) {
//        let alert = UIAlertController(title: "Warning", message: "Are you sure you want to proceed with the Delete?", preferredStyle: .alert)
//
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//            alert.addAction(UIAlertAction(title: "Proceed", style: .default, handler: { action in
//                print("Go to Delete")
//
//                let TreeCd: Int = self.tree.TreeCd ?? 0
//                print(TreeCd)
//                self.apiService.deleteTreeData(appName: "TreeCensus", electionName: "NMMC", userName: "BHUSHAN_P20", designation: "Software Developer", operation: "delete", TreeCd: TreeCd ) { result in
//                    switch result {
//                    case .success(let json):
//                            print(json)
//                            // Show a success message to the user
//                            DispatchQueue.main.async {
//                                                    self.navigationController?.popViewController(animated: true)
//                                                    if let previousVC = self.navigationController?.viewControllers.last as? ViewController {
//                                                        previousVC.refreshData()
//                                                    }
//                            }
//
//
//
//
//                    case .failure(let error):
//                        print(error)
//                        // Handle the error here
//                    }
//                }
//
//                }))
//
//                present(alert, animated: true, completion: nil)
//        }
            
}
