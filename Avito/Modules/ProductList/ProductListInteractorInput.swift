//
//  ProductListInteractorInput.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import Foundation

final class ProductListInteractorInput: ProductListInteractorInputProtocol {
    var output: ProductListInteractorOutputProtocol?
    var service: ProductListStorageProtocol? = nil

    @MainActor 
    func fetchItems() {
        let items = service?.loadProducts() ?? []
        output?.fetchedItems(items)
    }

    @MainActor
    func addProduct(_ product: ProductListModel) {
        service?.insertProducts(product)
    }

    @MainActor
    func removeProduct(_ product: ProductListModel) {
        service?.removeProduct(product)
    }
}
