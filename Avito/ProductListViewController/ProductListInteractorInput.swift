//
//  ProductListInteractorInput.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import Foundation

final class ProductListInteractorInput: ProductListInteractorInputProtocol {
    var output: ProductListInteractorOutputProtocol?
    
    func fetchItems() {

        let items: [ProductListModel] = [
            ProductListModel(imageName: "heart", price: "Price1", description: "Description1"),
            ProductListModel(imageName: "heart", price: "Price2", description: "Description2"),
            ProductListModel(imageName: "heart", price: "Price3", description: "Description3"),
            ProductListModel(imageName: "heart", price: "Price4", description: "Description4"),
            ProductListModel(imageName: "heart", price: "Price5", description: "Description5"),
            ProductListModel(imageName: "heart", price: "Price6", description: "Description6"),
            ProductListModel(imageName: "heart", price: "Price7", description: "Description7"),
            ProductListModel(imageName: "heart", price: "Price8", description: "Description8"),
        ]

        output?.fetchedItems(items)
    }
}
