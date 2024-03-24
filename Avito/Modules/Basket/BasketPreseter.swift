//
//  BasketPresenter.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import Foundation

final class BasketPresenter: BasketPresenterProtocol {
    weak var view: BasketViewProtocol?
    var interactor: BasketInteractorInputProtocol?
    var router: BasketRouterProtocol?
    var productListItems: [ProductListModel] = []
    weak var childCoordiator: ChildCoordinator?

    func viewDidLoad() {
        interactor?.fetchItems()
    }
    
    func numberOfItems() -> Int {
        return productListItems.count
    }

    func configureCell(_ cell: BasketCell, at index: Int) {
        let item = productListItems[index]
        cell.configure(item)
    }
}

extension BasketPresenter: BasketInteractorOutputProtocol {
    func fetchedItems(_ items: [ProductListModel]) {
        productListItems = items
        view?.showItems(items)
    }
}
