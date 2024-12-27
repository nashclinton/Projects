import UIKit

class FamilyTableViewController: UITableViewController {
    
    var controller = FamilyController.shared

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.family.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "familyMembers", for: indexPath) as! FamilyTableViewCell
        let familyMember = controller.family[indexPath.row]
        cell.update(with: familyMember)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        
        controller.selectedFamilyMember = controller.family[indexPath.row]
        
    }

}
