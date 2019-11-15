

import UIKit

class FilterVC: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var names:[String] = []
    var selectedNames:[String] = []
    var nameSelected:((_ data: String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sort By"
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func reload() {
        tableview.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        names = ["Cheapest","Nearest"]
        self.tableview.reloadData()
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem){
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func doneAction(_ sender: UIBarButtonItem){
        self.navigationController?.popViewController(animated: false)
    }
}

extension FilterVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FilterCell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FilterCell
        cell.fill(names[indexPath.row],selectedNames)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sName = names[indexPath.row]
        let nms = selectedNames.filter { (existName) -> Bool in
            sName == existName
        }
        if nms.count == 0{
            selectedNames = []
            selectedNames.append(sName)
            reload()
        }
       
    }
}
