//
//  DetailCoordinator.swift
//  Avito
//
//  Created by Nikita on 24.03.2024.
//

import UIKit

final class DetailCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?

    var parent: ProductCoordinator?
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(animated: Bool) {
        let vc = DetailViewController()

        viewControllerRef = vc
        navigationController.present(vc, animated: animated)
    }

    func coordinatorDidFinish() {
        parent?.coordinatorDidFinish()
    }
}
