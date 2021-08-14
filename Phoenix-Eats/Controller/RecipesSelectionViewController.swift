//
//  RecipesSelectionViewController.swift
//  Phoenix-Eats
//
//  Created by jeazous on 8/11/21.
//

import UIKit

class RecipesSelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    // UICollectionView outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Instances
    var foodCategory: String!
    var recipes: [Recipe]!
    let foodData = FoodData()
    
    // This Recipe instance will be passed to tthe next view controller
    var recipeToPass: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UICollectionViewDelegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Storing all the
        recipes = foodData.getRecipes(forCategoryTitle: foodCategory)
        
    }
    
    // UICollectionView delegate methods
    
    // This method returns the number of items in our collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    // Just like cellForRowAt in UITableView, this method configures what we display in every item in our UICollectionView
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as? RecipeCell {
            
            let recipe = recipes[indexPath.item]
            cell.configureCell(recipe: recipe)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    // This method determines the size of every item in our UICollectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let cellDimension = (width / 2) - 15
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    // This method determines what happens when we click on every UICollectionView item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        recipeToPass = recipes[indexPath.item]
        performSegue(withIdentifier: "toRecipeSelection", sender: self)
    }
    
    // This method is responsible for passing data to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? RecipeDetailViewController {
            
            // We're passing a selected reciple to the next view controller
            detailsVC.selectedRecipe = recipeToPass
        }
    }
}
