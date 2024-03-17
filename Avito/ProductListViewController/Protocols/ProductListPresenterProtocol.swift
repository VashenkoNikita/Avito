//
//  ProductListPresenterProtocol.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

protocol ProductListPresenterProtocol: AnyObject {
    var view: ProductListViewProtocol? { get }
    var interactor: ProductListInteractorInputProtocol? { get }
    var router: ProductListRouterProtocol? { get }

    func viewDidLoad()
    func numberOfItems() -> Int
    func configureCell(_ cell: ProductListCell, at index: Int)
    func clickCell()
    func addItem(_ item: ProductListModel)
    func addFavorite(_ item: ProductListModel)
    func addBasket(_ item: ProductListModel)
    func removeFavorite(_ item: ProductListModel)
    func removedBasket(_ item: ProductListModel)
}
