//
//  HomeViewController.swift
//  cookbook
//
//  Created by Amber Spadafora on 6/9/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var yourRecipesLabel: UILabel!
    @IBOutlet weak var cookGirlImage: UIImageView!
    @IBOutlet weak var recipeTableView: UITableView!
    
    var recipes: [Recipe] = [Recipe(title: "Spinach Omlette", ingredients: [], steps: [], category: RecipeCategory.breakfast), Recipe(title: "Eggs Benedict", ingredients: [], steps: [], category: RecipeCategory.breakfast), Recipe(title: "Bagel", ingredients: [], steps: [], category: RecipeCategory.breakfast), Recipe(title: "Spinach Salad", ingredients: [], steps: [], category: RecipeCategory.lunch)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openingAnimation()
        setUpRecipeTableView()
    }
    
    private func openingAnimation() {
        cookGirlImage.alpha = 0.0
        yourRecipesLabel.alpha = 0.0
        recipeTableView.alpha = 0.0
        
        UIView.animate(withDuration: 1.05) {
            self.cookGirlImage.alpha = 1.0
            self.yourRecipesLabel.alpha = 1.0
            self.recipeTableView.alpha = 1.0
            self.yourRecipesLabel.transform = CGAffineTransform(translationX: 15, y: 0)
            self.cookGirlImage.transform = CGAffineTransform(translationX: 15, y: 0)
            self.recipeTableView.transform = CGAffineTransform(translationX: 8, y: 0)
        }
    }
    
    private func setUpRecipeTableView() {
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 22))
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 8, width: headerView.frame.width - 8.0, height: headerView.frame.height - 8))
        titleLabel.text = "\(RecipeCategory.allCases[section])"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = UIColor.white
        headerView.addSubview(titleLabel)
        headerView.backgroundColor = UIColor.systemRed
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return RecipeCategory.allCases.count
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let recipesForSection = recipes.filter { (recipe) -> Bool in
            recipe.category.rawValue == section
        }
        return recipesForSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as? RecipeTableViewCell else { return UITableViewCell() }
        
        let recipeSection = indexPath.section
        let recipeForCell = self.recipes.filter { (recipe) -> Bool in
            recipe.category.rawValue == recipeSection
        }[indexPath.row]
        cell.recipeTitleLabel.text = recipeForCell.title
        
        return cell
    }
}
