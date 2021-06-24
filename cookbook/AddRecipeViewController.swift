//
//  AddRecipeViewController.swift
//  cookbook
//
//  Created by Amber Spadafora on 6/24/21.
//

import UIKit

class AddRecipeViewController: UIViewController {

    @IBOutlet weak var addARecipeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    fileprivate func setUpView() {
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.addARecipeLabel.alpha = 0.0
        UIView.animate(withDuration: 1.05) {
            self.addARecipeLabel.alpha = 1.0
            self.addARecipeLabel.transform = CGAffineTransform(translationX: 15, y: 0)
        }
    }

}
