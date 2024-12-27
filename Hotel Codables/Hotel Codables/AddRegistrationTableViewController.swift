//
//  AddRegistrationTableViewController.swift
//  Hotel Codables
//
//  Created by Nash Clinton on 10/29/24.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var adultCounter: UILabel!
    @IBOutlet weak var childrenCounter: UILabel!
    
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    let checkInLabelCellIndexPath = IndexPath(row: 0, section: 1 )
    let checkInPickerCellIndexPath = IndexPath(row: 1, section: 1 )
    let checkOutLabelCellIndexPath = IndexPath(row: 2, section: 1 )
    let checkOutPickerCellIndexPath = IndexPath(row: 3, section: 1 )
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.minimumDate = midnightToday
        updateDateViews()
        updateNumberOfGuests()
    }
    @IBAction func donePressed(_ sender: Any) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let hasWifi = wifiSwitch.isOn
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
    }
    func updateNumberOfGuests() {
        adultCounter.text = "\(Int(numberOfAdultsStepper.value))"
        childrenCounter.text = "\(Int(numberOfChildrenStepper.value))"
    }
    @IBAction func StepperPressed(_ sender: Any) {
        updateNumberOfGuests()
    }
    func updateDateViews() {
        checkInDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 2, to: checkInDatePicker.date)
    }
    @IBAction func datePickerValueChanged(_ sender: Any) {
        updateDateViews()
    }
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    var isCheckOutDatePickerVisible: Bool = false {
            didSet {
                checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            switch indexPath {
            case checkInLabelCellIndexPath where !isCheckOutDatePickerVisible:
                isCheckInDatePickerVisible.toggle()
            case checkOutLabelCellIndexPath where !isCheckInDatePickerVisible:
                isCheckOutDatePickerVisible.toggle()
            case checkInLabelCellIndexPath, checkOutLabelCellIndexPath:
                isCheckInDatePickerVisible.toggle()
                isCheckOutDatePickerVisible.toggle()
            default:
                return
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    
    @IBAction func wifiSwitchChanged(_ sender: Any) {
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInPickerCellIndexPath where isCheckInDatePickerVisible == false: return 0
        case checkOutPickerCellIndexPath where isCheckOutDatePickerVisible == false: return 0
        default: return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInPickerCellIndexPath:
            return 190
        case checkOutPickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
    
}
    
