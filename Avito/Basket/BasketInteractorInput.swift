//
//  BasketInteractorInput.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import Foundation

final class BasketInteractorInput: BasketInteractorInputProtocol {
    var output: BasketInteractorOutputProtocol?

    func fetchItems() {

        let items: [ProductListModel] = [
            ProductListModel(imageName: "heart", price: "Price1", description: "Description1"),
        ]

        output?.fetchedItems(items)
    }
}
