import UIKit

class LifeFormTableViewController: UITableViewController {
    @IBOutlet var searchBar: UISearchBar!
    
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        Task {
            do {
                let imageUrl =  try await getItem(id: 46577088)
                print(imageUrl)
                print("Get item ran")
            }
            catch {
                print(error)
            }
        }
    }
    
    func fetchMatchingItems() async {
        self.items = [] // Clear existing items
        let searchTerm = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard !searchTerm.isEmpty else {
            self.tableView.reloadData()
            return
        }
        
        let query = [
            "q": searchTerm,
            "language": "en",
            "page": "1"
        ]
        
        await displayItems(matching: query)
    }
    
    func displayItems(matching query: [String: String]) async {
        do {
            let storeItems = try await fetchItems(matching: query)
            await MainActor.run {
                let searchTerm = query["q"]!.lowercased()
                let searchWords = searchTerm.split(separator: " ").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                
                self.items = storeItems.filter { item in
                    let itemName = item.name.lowercased()
                    return searchWords.allSatisfy { word in
                        itemName.contains(word)
                    }
                }
                self.tableView.reloadData()
            }
        } catch {
            await MainActor.run {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as? LifeFormTableViewCell else {
            fatalError("Unable to dequeue LifeFormTableViewCell")
        }
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowDetailSegue", sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue",
           let destinationVC = segue.destination as? LifeFormViewController,
           let indexPath = sender as? IndexPath {
            let selectedItem = items[indexPath.row]
            destinationVC.itemId = selectedItem.id
            destinationVC.itemName = selectedItem.name
        }
    }



    
    func configure(cell: LifeFormTableViewCell, forItemAt indexPath: IndexPath) {
        guard indexPath.row < items.count else {
            print("Index out of range: \(indexPath.row)")
            return
        }
        
        let item = items[indexPath.row]
        cell.name = item.name
    }
}

    // MARK: - UISearchBarDelegate

    extension LifeFormTableViewController: UISearchBarDelegate {

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
