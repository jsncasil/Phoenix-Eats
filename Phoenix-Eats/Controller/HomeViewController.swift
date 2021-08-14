//
//  HomeViewController.swift
//  Phoenix-Eats
//
//  Created by jeazous on 8/11/21.
//

import UIKit

// TODO: 0. Conform these HomeViewController class to our UITableView protocols, UITableViewDelegate and UITableViewDataSource
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // TODO: 1. Create an outlet called "tableView" and connect it to the Table View on Storyboard
    
    @IBOutlet weak var tableView: UITableView!
    
    // TODO: 2. Create a constant that is an instance of type FoodData and call it "foodData"
    let foodData = FoodData()
    
    // TODO: 3. Create a variable called "categoryToPass" and initialized to empty string
    var categoryToPass: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: 4. Conform to the table view delegate protocols by assigning tableView.delegate and tableView.dataSource to self
        self.tableView.delegate = (tableView.dataSource as! UITableViewDelegate)
    }
    
    // These methods are part of UITableView delegate methods
    
    // This method determines the number of rows in our UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // TODO: 5. return the number of categories in our foodData instance instead of 0
        return foodData.categories.count
    }
    
    // This method configures what we display in every cell for row in our UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // TODO: 6. Using optional binding (if-let), create a cell by using tableView.dequeueReusableCell method and typecasting the cell to CategoryCell
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as? CategoryCell {
            
            
        // TODO: 7. Inside the optional binding, call the configureCell method and in the parameters, assign every items in the categories found inside foodData instance
            
            cell.configureCell(category: foodData.categories[indexPath.row])
        
        // TODO: 8. Return the cell here
            return cell
    }
        return UITableViewCell()
    }
    
    // This method determines the height of every row in our UITableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    // This method determines what happens whenever we click on every row in our UITableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // TODO: 9. Pass in the title found in every item in categories inside our foodData instance and assign it to categoryToPass variable we declared above
        
        categoryToPass = foodData.categories[indexPath.row].title
        
        // TODO: 10. Call performSegue method and pass in the identifier "toRecipesSelection" and "self" for the sender
        self.performSegue(withIdentifier: "toRecipesSelection", sender: self)
    }
    
    // This mathod is responsible for passing data to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipesVC = segue.destination as? RecipesSelectionViewController {

            recipesVC.foodCategory = categoryToPass
        }
    }
}

