//
//  TabBarRouter.swift
//  Avito
//
//  Created by Nikita on 10.03.2024.
//

import UIKit

final class TabBarRouter: TabBarRouterProtocol {
    static func createModule() -> UIViewController {
        let view = TabBarViewController()
        let presenter = TabBarPresenter()
        let interactor = TabBarInteractor()
        let router = TabBarRouter()

        view.setViewControllers(createViewControllers(), animated: true)

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter

        return view
    }
}

extension TabBarRouter {
    private static func createViewControllers() -> [UIViewController] {
        // Настройка вкладок и контроллеров
        let productListViewController = ProductListRouter.createModule()
        let crashViewController = BasketRouter.createModule()
        let favoriteViewController = FavoriteRouter.createModule()

        let productListItem = UITabBarItem(
            title: "Список товаров",
            image: UIImage(systemName: "list.bullet.clipboard"),
            tag: 0
        )
        let crashItem = UITabBarItem(
            title: "Корзина",
            image: UIImage(systemName: "basket"),
            tag: 1
        )
        let favoriteItem = UITabBarItem(
            title: "Избранное",
            image: UIImage(systemName: "star"),
            tag: 2
        )

        productListViewController.tabBarItem = productListItem
        crashViewController.tabBarItem = crashItem
        favoriteViewController.tabBarItem = favoriteItem

        let viewControllers = [
            productListViewController,
            crashViewController,
            favoriteViewController
        ]

        return viewControllers
    }
}
