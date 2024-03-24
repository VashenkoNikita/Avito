//
//  MainCoordinator.swift
//  Avito
//
//  Created by Nikita on 24.03.2024.
//

import UIKit

class MainCoordinator: Coordinator, ParentCoordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    var baseTabBarController: TabBarViewController?

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let presenter = TabBarPresenter()
        let interactor = TabBarInteractor()
        let router = TabBarRouter()

        baseTabBarController = TabBarViewController(presenter: presenter)
        guard let tabBar = baseTabBarController else { return }

        presenter.view = tabBar
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter

        presenter.coordinator = self
        navigationController.pushViewController(tabBar, animated: animated)
    }
}

extension MainCoordinator {
    func productScreen(navigationController: UINavigationController, animated: Bool) {
        let productListCoordinator = ProductCoordinator(navigationController: navigationController)
        productListCoordinator.parent = self
        addChild(productListCoordinator)
        productListCoordinator.start(animated: animated)
    }

    func favoriteScreen(navigationController: UINavigationController, animated: Bool) {
        let favoriteCoordinator = FavoriteCoordinator(navigationController: navigationController)
        favoriteCoordinator.parent = self
        addChild(favoriteCoordinator)
        favoriteCoordinator.start(animated: animated)
    }

    func basketScreen(navigationController: UINavigationController, animated: Bool) {
        let basketCoordinator = FavoriteCoordinator(navigationController: navigationController)
        basketCoordinator.parent = self
        addChild(basketCoordinator)
        basketCoordinator.start(animated: animated)
    }
}
