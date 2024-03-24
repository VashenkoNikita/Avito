//
//  BasketInteractorProtocol.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

protocol BasketInteractorInputProtocol: AnyObject {
    var output: BasketInteractorOutputProtocol? { get }

    func fetchItems()
}

protocol BasketInteractorOutputProtocol: AnyObject {
    func fetchedItems(_ items: [ProductListModel])
}
