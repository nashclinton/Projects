import UIKit

class BookTableViewController: UITableViewController {
    
    var books: [Book] = [Book(icon: "example", name: "example", dueDate: Date())]

    
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
    
    
    @IBSegueAction func addEditBook(_ coder: NSCoder, sender: Any?) -> AddEditBookTableViewController? {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            let bookToEdit = books[indexPath.row]
            
            let viewController = AddEditBookTableViewController(coder: coder)

            viewController?.book = bookToEdit
            print(books)
            return viewController
        } else {
            print(books)
            return AddEditBookTableViewController(coder: coder)
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

        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell

        let book = books[indexPath.row]

        cell.update(with: book)
        cell.showsReorderControl = true

        return cell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
           
        }
    }


    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedBook = books.remove(at: fromIndexPath.row)
        books.insert(movedBook, at: to.row)
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    @IBAction func addBook(_ unwindSegue: UIStoryboardSegue) {

        guard unwindSegue.identifier == "save",
              let sourceViewController = unwindSegue.source as? AddEditBookTableViewController,
              let book = sourceViewController.book else { return }

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
