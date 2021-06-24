//
//  Recipe.swift
//  cookbook
//
//  Created by Amber Spadafora on 6/12/21.
//

import Foundation

enum RecipeCategory: Int32, CaseIterable {
    case breakfast = 0, lunch, dinner, snack, dessert
}

struct Recipe {
    var title: String
    var ingredients: [String]
    var steps: [String]
    var category: RecipeCategory
}
