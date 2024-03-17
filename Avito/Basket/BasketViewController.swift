//
//  BasketViewController.swift
//  Avito
//
//  Created by Nikita on 13.02.2024.
//

import UIKit

final class BasketViewController: UIViewController, BasketViewProtocol {
    private enum Constants {
        static let offset: CGFloat = 20
        static let heightCell: CGFloat = 250
        static let productList = "Корзина товаров"
    }

    var presenter: BasketPresenterProtocol?
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupCollectionView()
        presenter?.viewDidLoad()
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let offset = Constants.offset
        layout.sectionInset = .init(top: offset, left: offset, bottom: offset, right: offset)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView?.backgroundColor = .black
        collectionView?.register(
            BasketCell.self,
            forCellWithReuseIdentifier: BasketCell.reuseIdentifier
        )
        collectionView?.dataSource = self
        collectionView?.delegate = self
        guard let collectionView else { return }
        view.addSubview(collectionView)
    }


    func showItems(_ items: [ProductListModel]) {
        collectionView?.reloadData()
    }

    private func setupUI() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationItem.title = Constants.productList
    }
}

// MARK: UICollectionViewDataSource

extension BasketViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItems() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasketCell.reuseIdentifier, for: indexPath) as? BasketCell else { return UICollectionViewCell() }
        cell.delegate = self
        presenter?.configureCell(cell, at: indexPath.item)
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension BasketViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2 - (Constants.offset * 2)
        return CGSize(width: width, height: Constants.heightCell)
    }
}

extension BasketViewController: BasketCellDelegateProtocol {
    func removeWithoutBasket(_ item: ProductListModel?) {
        print("removeWithoutBasket \(item)")
    }
    
    func addFavorite(_ item: ProductListModel?) {
        print("salamfavorite \(item)")
    }
}

