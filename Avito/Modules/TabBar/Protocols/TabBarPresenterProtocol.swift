//
//  TabBarPresenterProtocol.swift
//  Avito
//
//  Created by Nikita on 10.03.2024.
//

import UIKit

protocol TabBarPresenterProtocol: AnyObject {
    var view: TabBarViewProtocol? { get }
    var interactor: TabBarInteractorInputProtocol? { get }
    var router: TabBarRouterProtocol? { get }

    func viewDidLoad() 
    func createScreens() -> [UIViewController] 
}
