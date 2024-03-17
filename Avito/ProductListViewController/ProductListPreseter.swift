//
//  ProductListPreseter.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import Foundation

final class ProductListPreseter: ProductListPresenterProtocol {
    weak var view: ProductListViewProtocol?
    var interactor: ProductListInteractorInputProtocol?
    var router: ProductListRouterProtocol?
    var productListItems: [ProductListModel] = []

    func viewDidLoad() {
        interactor?.fetchItems()
    }
    
    func numberOfItems() -> Int {
        return productListItems.count
    }

    func configureCell(_ cell: ProductListCell, at index: Int) {
        let item = productListItems[index]
        cell.configure(item)
    }

    func clickCell() {
        router?.showDetailScreen()
    }
}

extension ProductListPreseter: ProductListInteractorOutputProtocol {
    func fetchedItems(_ items: [ProductListModel]) {
        productListItems = items
        view?.showItems(items)
    }
}
