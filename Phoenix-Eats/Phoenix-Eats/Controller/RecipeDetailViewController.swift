//
//  RecipeDetailViewController.swift
//  Phoenix-Eats
//
//  Created by jeazous on 8/11/21.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeInstructions: UILabel!
    @IBOutlet weak var orderMeal: UIButton!
    
    var selectedRecipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: 11. Configure all the UI elements by passing in the properties to its respective UI element
        // Hint: 1 for recipeImage, one for recipeTitle, and one for recipeInstructions
        recipeImg.layer.cornerRadius = recipeImg.frame.size.height / 2
        recipeTitle.layer.cornerRadius = recipeTitle.frame.size.height / 2
        recipeInstructions.layer.cornerRadius = recipeInstructions.frame.size.height / 2
        orderMeal.layer.cornerRadius = orderMeal.frame.size.height / 2
    }
    
    // This shows a message when the order meal button is clicked
    @IBAction func orderTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Coming Soon!", message: "H Resto is coming in 2022 on Hikre campus", preferredStyle: .alert)
        let moveAction = UIAlertAction(title: "I understand!", style: .cancel, handler: nil)
        
        alert.addAction(moveAction)
        present(alert, animated: true, completion: nil)
        
    }
}
