//
//  FavoritePresenterProtocol.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

protocol FavoritePresenterProtocol: AnyObject {
    var view: FavoriteViewProtocol? { get }
    var interactor: FavoriteInteractorInputProtocol? { get }
    var router: FavoriteRouterProtocol? { get }


    func viewDidLoad()
    func numberOfItems() -> Int
    func configureCell(_ cell: FavoriteCell, at index: Int)
}

