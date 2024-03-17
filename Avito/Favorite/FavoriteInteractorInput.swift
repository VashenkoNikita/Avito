//
//  FavoriteInteractorInput.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

final class FavoriteInteractorInput: FavoriteInteractorInputProtocol {
    var output: FavoriteInteractorOutputProtocol?

    func fetchItems() {

        let items: [ProductListModel] = [
            ProductListModel(imageName: "heart", price: "Price1", description: "Description1"),
            ProductListModel(imageName: "heart", price: "Price2", description: "Description2"),
            ProductListModel(imageName: "heart", price: "Price3", description: "Description3")
        ]

        output?.fetchedItems(items)
    }
}
