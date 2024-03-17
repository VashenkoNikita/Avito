//
//  BasketRouter.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import UIKit

final class BasketRouter: BasketRouterProtocol {
    static func createModule() -> UIViewController {
        let view = BasketViewController()
        let presenter = BasketPresenter()
        let interactor = BasketInteractorInput()
        let router = BasketRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter

        return UINavigationController(rootViewController: view)
    }
}
