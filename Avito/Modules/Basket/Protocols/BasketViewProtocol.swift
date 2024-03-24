//
//  BasketViewProtocol.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

protocol BasketViewProtocol: AnyObject {
    // view presenter
    var presenter: BasketPresenterProtocol? { get }

    // метод для отображения items
    func showItems(_ items: [ProductListModel])
}
