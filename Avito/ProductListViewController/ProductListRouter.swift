//
//  ProductListRouter.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import UIKit

final class ProductListRouter: ProductListRouterProtocol {
    private static let view = ProductListViewController()

    static func createModule() -> UIViewController {
        let presenter = ProductListPreseter()
        let interactor = ProductListInteractorInput()
        let router = ProductListRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter

        return UINavigationController(rootViewController: view)
    }

    func showDetailScreen() {
        let viewController = DetailViewController()
        ProductListRouter.view.navigationController?.present(viewController, animated: true)
    }
}
