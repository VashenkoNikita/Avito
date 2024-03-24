//
//  FavoritePreseter.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import Foundation

final class FavoritePreseter: FavoritePresenterProtocol {
    weak var view: FavoriteViewProtocol?
    var interactor: FavoriteInteractorInputProtocol?
    var router: FavoriteRouterProtocol?
    var productListItems: [ProductListModel] = []
    weak var childCoordiator: ChildCoordinator?

    func viewDidLoad() {
        interactor?.fetchItems()
    }
    
    func numberOfItems() -> Int {
        return productListItems.count
    }

    func configureCell(_ cell: FavoriteCell, at index: Int) {
        let item = productListItems[index]
        cell.configure(item)
    }
}

extension FavoritePreseter: FavoriteInteractorOutputProtocol {
    func fetchedItems(_ items: [ProductListModel]) {
        productListItems = items
        view?.showItems(items)
    }
}
