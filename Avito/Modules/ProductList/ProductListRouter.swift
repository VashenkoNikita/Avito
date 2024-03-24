//
//  ProductListRouter.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import UIKit

final class ProductListRouter: ProductListRouterProtocol {
    private static let view = ProductListViewController()

    func showDetailScreen() {
        let viewController = DetailViewController()
        ProductListRouter.view.navigationController?.present(viewController, animated: true)
    }
}
