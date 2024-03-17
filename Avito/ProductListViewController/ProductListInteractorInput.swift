//
//  ProductListInteractorInput.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import Foundation

final class ProductListInteractorInput: ProductListInteractorInputProtocol {
    var output: ProductListInteractorOutputProtocol?
    var service: StorageService? = nil

    @MainActor 
    func fetchItems() {
        let items = service?.loadProducts() ?? []
        output?.fetchedItems(items)
    }

    @MainActor
    func addProduct(_ product: ProductListModel) {
        service?.insertProduct(product)
    }

    @MainActor
    func addProductBasket(_ product: ProductListModel) {
        service?.insertProductBasket(product)
    }

    @MainActor
    func addProductFavorite(_ product: ProductListModel) {
        service?.insertProductFavorite(product)
    }

    @MainActor
    func removeProductBasket(_ product: ProductListModel) {
        service?.removeProductBasket(product)
    }

    @MainActor
    func removeProductFavorite(_ product: ProductListModel) {
        service?.removeProductFavorite(product)
    }
}
