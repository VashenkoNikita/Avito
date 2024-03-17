//
//  FavoriteRouter.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import UIKit

final class FavoriteRouter: FavoriteRouterProtocol {
    static func createModule() -> UIViewController {
        let view = FavoriteViewController()
        let presenter = FavoritePreseter()
        let interactor = FavoriteInteractorInput()
        let router = FavoriteRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter

        return UINavigationController(rootViewController: view)
    }
}
