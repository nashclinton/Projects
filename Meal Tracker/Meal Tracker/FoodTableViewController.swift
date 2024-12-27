//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Nash Clinton on 10/15/24.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] = [
        Meal(name: "Breakfast", food: [
            Food(name: "Oatmeal", description: "Basically wet plant skin flakes"),
            Food(name: "Bananas", description: "Monkey ah ah"),
            Food(name: "Eggs", description: "Perfect for house decor")
        ]),
        Meal(name: "Lunch", food: [
            Food(name: "Sandwich", description: "Idiot Sandwich!"),
            Food(name: "Pizza", description: "Pizza Pizza"),
            Food(name: "Chicken", description: "I ain't no chicken")
        ]),
        Meal(name: "Dinner", food: [
            Food(name: "Steak", description: "What do you call a one legged cow?"),
            Food(name: "Pasta", description: "A white person's crack"),
            Food(name: "Mashed Potatoes", description: "Boil em mash em stick em in a stew")
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Meals"
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = food.name
        contentConfig.secondaryText = food.description
        
        cell.contentConfiguration = contentConfig
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    
}
