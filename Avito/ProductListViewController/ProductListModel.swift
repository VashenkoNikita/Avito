//
//  ProductListModel.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import SwiftData

@Model
final class ProductListModel {
    var imageName: String?
    var price: String?
    var descript: String?
    var isHaveBasket: Bool?
    var isHaveFavorite: Bool?

    init(imageName: String? = nil, 
         price: String? = nil,
         descript: String? = nil,
         isHaveBasket: Bool? = nil,
         isHaveFavorite: Bool? = nil)
    {
        self.imageName = imageName
        self.price = price
        self.descript = descript
        self.isHaveBasket = isHaveBasket
        self.isHaveFavorite = isHaveFavorite
    }
}
