//
//  ProductListViewController.swift
//  Avito
//
//  Created by Nikita on 13.02.2024.
//

import UIKit

final class FavoriteViewController: UIViewController, FavoriteViewProtocol {
    private enum Constants {
        static let offset: CGFloat = 10
        static let heightCell: CGFloat = 270
        static let productList = "Избранное"
    }

    var presenter: FavoritePresenterProtocol?
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
            FavoriteCell.self,
            forCellWithReuseIdentifier: FavoriteCell.reuseIdentifier
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

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItems() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCell.reuseIdentifier, for: indexPath) as? FavoriteCell else { return UICollectionViewCell() }
        cell.delegate = self
        presenter?.configureCell(cell, at: indexPath.item)
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2 - (Constants.offset * 2)
        return CGSize(width: width, height: Constants.heightCell)
    }
}

extension FavoriteViewController: FavoriteCellDelegateProtocol {
    func removeFavorite(_ item: ProductListModel?) {
        
    }
    
    func addBasket(_ item: ProductListModel?) {

    }
}

