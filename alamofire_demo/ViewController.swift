import UIKit

class ViewController: UIViewController {

    let apiService = TreeCensusAPIService()

    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var search: UISearchBar!
    
    @IBOutlet weak var namesTable: UITableView!
    
    var treeList: [Tree] = []
    var filterTreeList: [Tree] = []
    
    var dropdownList: [allSpecie] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems ()
        
        namesTable.delegate = self
        namesTable.dataSource = self
        refreshData()
    }
    
    private func configureItems () {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
    barButtonSystemItem: .add,
    target: self,
    action: #selector(presentFormViewController))
    }
    @objc private func presentFormViewController() {
        // Load the main storyboard file
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate a FormViewController with the storyboard ID "FormVC"
        let formVC = storyboard.instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
        
        // Push the FormViewController onto the navigation stack
        navigationController?.pushViewController(formVC, animated: true)
    }
    
    func refreshData() {
        apiService.getTreeData(appName: "TreeCensus", electionName: "NMMC", userName: "BHUSHAN_P20", designation: "Software Developer", operation: "select") { result in
            switch result {
            case .success(let json):
                print(json)
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                    let decoder = JSONDecoder()
                    let treeListResponse = try decoder.decode(TreeResponse.self, from: jsonData)

                    self.treeList = treeListResponse.TreeMstList
                    self.filterTreeList = self.treeList // Update filterTreeList with new data
                    print(self.treeList.count)
                    DispatchQueue.main.async{
                        self.namesTable.reloadData()
                    }
                    
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            case .failure(let error):
                print(error)
                // Handle the error here
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterTreeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cellTableTableViewCell
        let tree = filterTreeList[indexPath.row]

        cell.nameLabel.text = tree.LocalName
        cell.editTreeContent.addTarget(self, action: #selector(editButtonTapped(_:)), for: .touchUpInside)
        cell.editTreeContent.tag = indexPath.row // set tag to row index

        return cell
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.global(qos: .userInitiated).async {
            let filteredTrees: [Tree]
            if searchText.isEmpty {
                filteredTrees = self.treeList
            } else {
                filteredTrees = self.treeList.filter { tree in
                    let nameMatch = tree.LocalName?.range(of: searchText, options: [.caseInsensitive, .diacriticInsensitive]) != nil
                
                    let speciesMatch = tree.Specie?.range(of: searchText, options: [.caseInsensitive, .diacriticInsensitive]) != nil
                    return nameMatch  || speciesMatch
                }
            }
            DispatchQueue.main.async {
                self.filterTreeList = filteredTrees
                self.namesTable.reloadData()
            }
        }
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            filterTreeList = []
            searchBar.text = ""
            searchBar.resignFirstResponder()
            namesTable.reloadData()
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // do nothing on row selection
    }
    
    

    @objc func editButtonTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "treesContent") as? treeContent
        vc?.tree = filterTreeList[sender.tag]
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
                // Code to delete row
                // ...
                print("swipe")
                let tree = self.filterTreeList[indexPath.row]
                let alert = UIAlertController(title: "Warning", message: "Are you sure you want to proceed with the Delete?", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    
                    alert.addAction(UIAlertAction(title: "Proceed", style: .default, handler: { action in
                        print("Go to Delete")
                        
                        let TreeCd: Int = tree.TreeCd ?? 0
                        print(TreeCd)
                        self.apiService.deleteTreeData(appName: "TreeCensus", electionName: "NMMC", userName: "BHUSHAN_P20", designation: "Software Developer", operation: "delete", TreeCd: TreeCd ) { result in
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
                        
                self.present(alert, animated: true, completion: nil)
                completionHandler(true)
            }
            let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
            return swipeConfiguration
        }
        
        


}



