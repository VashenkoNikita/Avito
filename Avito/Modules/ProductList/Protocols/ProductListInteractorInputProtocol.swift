//
//  ProductListInteractorProtocol.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

protocol ProductListInteractorInputProtocol: AnyObject {
    var output: ProductListInteractorOutputProtocol? { get }

    func fetchItems()
    func addProduct(_ product: ProductListModel)
    func removeProduct(_ product: ProductListModel)
}

protocol ProductListInteractorOutputProtocol: AnyObject {
    func fetchedItems(_ items: [ProductListModel])
}
