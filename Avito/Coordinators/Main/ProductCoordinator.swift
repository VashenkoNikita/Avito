//
//  ProductCoordinator.swift
//  Avito
//
//  Created by Nikita on 24.03.2024.
//

import UIKit

final class ProductCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?

    var parent: MainCoordinator?
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(animated: Bool) {
        let vc = ProductListViewController()
        let presenter = ProductListPreseter()
        let interactor = ProductListInteractorInput()
        let router = ProductListRouter()
        let service = ProductListStorage()

        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        interactor.service = service

        viewControllerRef = vc
        presenter.coordinator = self
        vc.tabBarItem = UITabBarItem(
            title: "Товары",
            image: UIImage(systemName: "list.bullet.clipboard.fill"),
            selectedImage: nil
        )
        navigationController.pushViewController(vc, animated: animated)
    }

    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}

extension ProductCoordinator {
    func detailScreen() {
        let coordinator = DetailCoordinator(navigationController: navigationController)
        coordinator.parent = self
        coordinator.start(animated: true)
    }
}
