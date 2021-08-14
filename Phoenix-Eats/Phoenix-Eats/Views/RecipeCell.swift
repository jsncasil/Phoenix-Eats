//
//  RecipeCell.swift
//  Phoenix-Eats
//
//  Created by jeazous on 8/11/21.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipeImg.layer.cornerRadius = 10
    }
    
    func configureCell(recipe: Recipe) {
        recipeImg.image = UIImage(named: recipe.imageName)
        recipeTitle.text = recipe.title
    }
}
