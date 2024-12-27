//
//  ViewController.swift
//  StudentList
//
//  Created by Parker Rushton on 10/15/24.
//

import UIKit

class StudentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let teachers = ["Parker", "Jane"]
    private let students = ["Kevin", "Gwen", "Kaylen", "Dylan", "Wesley", "Nash", "Kaden", "Skyler", "Reegan"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}


extension StudentsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return teachers.count
        } else {
            return students.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = teachers[indexPath.row]
        } else {
            cell.textLabel?.text = students[indexPath.row]
        }
        return cell
    }

}

extension StudentsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Teachers"
        } else {
            return "Students"
        }
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print("User tapped: \(indexPath)")
        var name = ""
        if indexPath.section == 0 {
            name = teachers[indexPath.row]
        } else {
            name = students[indexPath.row]
        }
        print("Hello: \(name)")
    }
}
