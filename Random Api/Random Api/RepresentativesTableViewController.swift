import UIKit

@MainActor
class RepresentativesTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    
    
    var items = [Representative]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RepresentativesTableViewCell.self, forCellReuseIdentifier: "Item")
           
        searchBar.delegate = self
    }
    
    func fetchMatchingItems() async {
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if !searchTerm.isEmpty {
            let query = [
                "name": searchTerm,
                "output": "json"
            ]
            await displayItems(matching: query)
        }
    }
    
    func displayItems(matching query: [String: String]) async {
        do {
            let representatives = try await fetchRepresentatives(matching: query)
            self.items = representatives
            self.tableView.reloadData() 
        } catch {
            print("Error fetching representatives: \(error)")
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as! RepresentativesTableViewCell
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configure(cell: RepresentativesTableViewCell, forItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        cell.name = item.name
        cell.location = "\(item.state), District \(item.district)"
    }
}

extension RepresentativesTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Task {
            await fetchMatchingItems()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Task {
            await fetchMatchingItems()
        }
        searchBar.resignFirstResponder()
    }
}
