//
//  ProductListPreseter.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

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

    func addItem(_ item: ProductListModel) {
        interactor?.addProduct(item)
        productListItems.append(item)
        view?.reloadData()
    }

    func addFavorite(_ item: ProductListModel) {
        interactor?.addProductFavorite(item)
    }

    func addBasket(_ item: ProductListModel) {
        interactor?.addProductBasket(item)
    }

    func removeFavorite(_ item: ProductListModel) {
        interactor?.removeProductFavorite(item)
    }
    
    func removedBasket(_ item: ProductListModel) {
        interactor?.removeProductBasket(item)
    }
}

extension ProductListPreseter: ProductListInteractorOutputProtocol {
    func fetchedItems(_ items: [ProductListModel]) {
        productListItems = items
        view?.reloadData()
    }
}
