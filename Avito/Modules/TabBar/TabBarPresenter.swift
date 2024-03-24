//
//  TabBarPresenter.swift
//  Avito
//
//  Created by Nikita on 10.03.2024.
//

import UIKit

final class TabBarPresenter: TabBarPresenterProtocol {
    weak var view: TabBarViewProtocol?
    weak var coordinator: MainCoordinator?
    var interactor: TabBarInteractorInputProtocol?
    var router: TabBarRouterProtocol?
    
    private let productCoordinator = ProductCoordinator(navigationController: UINavigationController())
    private let favoriteCoordinator = FavoriteCoordinator(navigationController: UINavigationController())
    private let basketCoordinator = BasketCoordinator(navigationController: UINavigationController())
    private (set) var initCoordinators = [Coordinator]()

    func viewDidLoad() {
        productCoordinator.parent = coordinator
        favoriteCoordinator.parent = coordinator
        basketCoordinator.parent = coordinator

        for item in [productCoordinator, favoriteCoordinator, basketCoordinator] {
            coordinator?.addChild(item as? Coordinator)
        }

        productCoordinator.start(animated: false)
        favoriteCoordinator.start(animated: false)
        basketCoordinator.start(animated: false)

        initCoordinators = coordinator?.childCoordinators ?? []
    }

    func createScreens() -> [UIViewController] {
        return [
            productCoordinator.navigationController,
            favoriteCoordinator.navigationController,
            basketCoordinator.navigationController
        ]
    }
}
