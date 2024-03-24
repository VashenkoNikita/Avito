//
//  FavoriteInteractorInput.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

final class FavoriteInteractorInput: FavoriteInteractorInputProtocol {
    var output: FavoriteInteractorOutputProtocol?
    var service: ProductListStorage? = nil

    @MainActor 
    func fetchItems() {
        output?.fetchedItems(service?.loadProducts() ?? [])
    }
}
