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
}
