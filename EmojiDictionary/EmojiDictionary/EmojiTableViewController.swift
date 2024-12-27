import UIKit

class BookTableViewController: UITableViewController {
    
    var books: [Book] = [
        Book(title: "Ender's Game", author: "Orson Scott Card", genre: "sciFi", length: 300),
        Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "classic", length: 250),
        Book(title: "The Alchemist", author: "Paulo Coelho", genre: "classic", length: 300),
        Book(title: "The Da Vinci Code", author: "Dan Brown", genre: "classic", length: 300),
        Book(title: "The Hitchhiker's Guide to the Galaxy", author: "Douglas Adams", genre: "classic", length: 300 )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> UITableViewController? {
        
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            let bookToEdit = books[indexPath.row]
            return AddEditBookTableViewController(coder: coder, book: bookToEdit)
        } else {
            return AddEditBookTableViewController(coder: coder, book: nil)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return books.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Step 1: Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell

        //Step 2: Fetch model object to display
        let book = books[indexPath.row]

        //Step 3: Configure cell
        cell.update(with: book)
        cell.showsReorderControl = true

        //Step 4: Return cell
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = books.remove(at: fromIndexPath.row)
        books.insert(movedEmoji, at: to.row)
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    @IBAction func addEmoji(_ unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "save", let sourceViewController = unwindSegue.source as? AddEditBookTableViewController, let book = sourceViewController.book else { return }
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            books[selectedIndexPath.row] = book
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: books.count, section: 0)
            books.append(book)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}
