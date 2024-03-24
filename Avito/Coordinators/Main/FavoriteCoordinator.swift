//
//  FavoriteCoordinator.swift
//  Avito
//
//  Created by Nikita on 24.03.2024.
//

import UIKit

final class FavoriteCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?

    var parent: MainCoordinator?
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(animated: Bool) {
        let vc = FavoriteViewController()
        let presenter = FavoritePreseter()
        let interactor = FavoriteInteractorInput()
        let router = FavoriteRouter()
        let service = ProductListStorage()

        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        interactor.service = service

        viewControllerRef = vc
        presenter.childCoordiator = self
        vc.tabBarItem = UITabBarItem(
            title: "Избранное",
            image: UIImage(systemName: "star.fill"),
            selectedImage: nil
        )
        navigationController.pushViewController(vc, animated: animated)
    }

    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}

