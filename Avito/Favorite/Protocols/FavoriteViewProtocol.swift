//
//  FavoriteViewProtocol.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

protocol FavoriteViewProtocol: AnyObject {
    // view presenter
    var presenter: FavoritePresenterProtocol? { get }

    // метод для отображения items
    func showItems(_ items: [ProductListModel])
}
