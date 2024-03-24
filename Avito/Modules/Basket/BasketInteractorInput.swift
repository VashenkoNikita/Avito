//
//  BasketInteractorInput.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import Foundation

final class BasketInteractorInput: BasketInteractorInputProtocol {
    var output: BasketInteractorOutputProtocol?
    var serviceBasket: ProductListStorage? = nil

    @MainActor
    func fetchItems() {
        output?.fetchedItems(serviceBasket?.loadProducts() ?? [])
    }
}
