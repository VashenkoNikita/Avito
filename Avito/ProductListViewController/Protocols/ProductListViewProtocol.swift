//
//  ProductListViewProtocol.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

protocol ProductListViewProtocol: AnyObject {
    // view presenter
    var presenter: ProductListPresenterProtocol? { get }

    // метод для обновления items
    func reloadData()
}
