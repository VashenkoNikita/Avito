//
//  TabBarViewController.swift
//  Avito
//
//  Created by Nikita on 10.03.2024.
//

import UIKit

//MARK: Create TabBarViewController

final class TabBarViewController: UITabBarController, TabBarViewProtocol {
    var presenter: TabBarPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: Setup UI

extension TabBarViewController {
    private func setupUI() {
        tabBar.barStyle = .black
    }
}
