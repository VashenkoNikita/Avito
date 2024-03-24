//
//  ProductListPreseter.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

final class ProductListPreseter: ProductListPresenterProtocol {
    weak var view: ProductListViewProtocol?
    weak var coordinator: ProductCoordinator?
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
        coordinator?.detailScreen()
    }
}

//MARK: - dowload & reload data

extension ProductListPreseter: ProductListInteractorOutputProtocol {
    func fetchedItems(_ items: [ProductListModel]) {
        productListItems = items
        view?.reloadData()
    }
}

//MARK: - Storage using

extension ProductListPreseter {
    func addItem(_ item: ProductListModel) {
        interactor?.addProduct(item)
        productListItems.append(item)
        view?.reloadData()
    }
}
