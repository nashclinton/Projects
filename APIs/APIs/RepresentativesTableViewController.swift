import UIKit

class RepresentativesTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    
    var items = [Representative]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    
    func fetchMatchingItems() async {
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        do {
            let allRepresentatives = try await fetchRepresentatives(matching: ["name": searchTerm, "output": "json"])
            
            if searchTerm.isEmpty {
                self.items = allRepresentatives
            } else {
                self.items = allRepresentatives.filter { representative in
                    representative.name.localizedCaseInsensitiveContains(searchTerm)
                }
            }
            
            self.tableView.reloadData()
        } catch {
            print("Error fetching representatives: \(error)")
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

        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        

        let thirdLabel = UILabel()
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.textColor = .gray
        thirdLabel.font = UIFont.systemFont(ofSize: 12)
        
        if cell.contentView.subviews.first(where: { $0 is UILabel && ($0 as! UILabel).font == thirdLabel.font }) == nil {
            cell.contentView.addSubview(thirdLabel)
            
            NSLayoutConstraint.activate([
                thirdLabel.leadingAnchor.constraint(equalTo: cell.textLabel!.trailingAnchor, constant: 10),
                thirdLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
                thirdLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10)
            ])
        }
        
        let representative = items[indexPath.row]
        cell.textLabel?.text = representative.name
        cell.detailTextLabel?.text = "\(representative.state), District \(representative.district)"
        thirdLabel.text =  representative.website 
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
