//
//  BasketCoordinator.swift
//  Avito
//
//  Created by Nikita on 24.03.2024.
//

import UIKit

final class BasketCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?

    var parent: MainCoordinator?
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(animated: Bool) {
        let vc = BasketViewController()
        let presenter = BasketPresenter()
        let interactor = BasketInteractorInput()
        let router = BasketRouter()
        let serviceBasket = ProductListStorage()

        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        interactor.serviceBasket = serviceBasket

        viewControllerRef = vc
        presenter.childCoordiator = self
        vc.tabBarItem = UITabBarItem(
            title: "Корзина",
            image: UIImage(systemName: "basket.fill"),
            selectedImage: nil
        )
        navigationController.pushViewController(vc, animated: animated)
    }

    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
}
