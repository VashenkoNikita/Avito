//
//  TabBarPresenter.swift
//  Avito
//
//  Created by Nikita on 10.03.2024.
//

import UIKit

final class TabBarPresenter: TabBarPresenterProtocol {
    weak var view: TabBarViewProtocol?
    var interactor: TabBarInteractorInputProtocol?
    var router: TabBarRouterProtocol?
}
