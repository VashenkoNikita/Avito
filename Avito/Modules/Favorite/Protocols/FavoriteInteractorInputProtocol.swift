//
//  FavoriteInteractorProtocol.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

protocol FavoriteInteractorInputProtocol: AnyObject {
    var output: FavoriteInteractorOutputProtocol? { get }

    func fetchItems()
}

protocol FavoriteInteractorOutputProtocol: AnyObject {
    func fetchedItems(_ items: [ProductListModel])
}
