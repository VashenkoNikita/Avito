//
//  BasketPresenterProtocol.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

protocol BasketPresenterProtocol: AnyObject {
    var view: BasketViewProtocol? { get }
    var interactor: BasketInteractorInputProtocol? { get }
    var router: BasketRouterProtocol? { get }

    func viewDidLoad()
    func numberOfItems() -> Int
    func configureCell(_ cell: BasketCell, at index: Int)
}

