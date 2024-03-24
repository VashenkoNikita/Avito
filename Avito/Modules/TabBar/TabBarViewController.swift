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

    init(presenter: TabBarPresenterProtocol? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.viewDidLoad()
        viewControllers = self.presenter?.createScreens()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: Setup UI

extension TabBarViewController {
    private func setupUI() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .white
        tabBar.layer.borderColor = UIColor.white.cgColor
        tabBar.layer.borderWidth = 2
    }
}
