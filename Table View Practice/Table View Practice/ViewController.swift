//
//  ViewController.swift
//  Table View Practice
//
//  Created by Nash Clinton on 10/22/24.
//

import UIKit

class ViewController: UIViewController {

    let data = ["Hello", "World", "Swift", "UITableView"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "idCell")
        else {
            return UITableViewCell()
        }
        let dataObject = data[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = dataObject
        cell.contentConfiguration = content
        
        return cell
    }
    
}
extension ViewController: UITableViewDelegate {
    
}
