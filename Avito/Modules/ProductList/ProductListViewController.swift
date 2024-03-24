//
//  ProductListViewController.swift
//  Avito
//
//  Created by Nikita on 13.02.2024.
//

import UIKit

final class ProductListViewController: UIViewController, ProductListViewProtocol {
    private enum Constants {
        static let offset: CGFloat = 10
        static let heightCell: CGFloat = 270
        static let productList = "Список товаров"
    }

    var presenter: ProductListPresenterProtocol?
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
            ProductListCell.self,
            forCellWithReuseIdentifier: ProductListCell.reuseIdentifier
        )
        collectionView?.dataSource = self
        collectionView?.delegate = self
        guard let collectionView else { return }
        view.addSubview(collectionView)
    }


    func reloadData() {
        collectionView?.reloadData()
    }

    private func setupUI() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationItem.title = Constants.productList

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createProduct))
    }

    @objc
    private func createProduct() {
        let item = ProductListModel(
            imageName: "avito",
            price: "10 000 P",
            descript: "Описание товара — это блок с информацией."
        )
        presenter?.addItem(item)
        collectionView?.reloadData()
    }
}

// MARK: UICollectionViewDataSource

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItems() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCell.reuseIdentifier, for: indexPath) as? ProductListCell else { return UICollectionViewCell() }
        cell.delegate = self
        presenter?.configureCell(cell, at: indexPath.item)
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension ProductListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2 - (Constants.offset * 2)
        return CGSize(width: width, height: Constants.heightCell)
    }
}

// MARK: UICollectionViewDelegate

extension ProductListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.clickCell()
    }
}

// MARK: ProductListCellDelegateProtocol

extension ProductListViewController: ProductListCellDelegateProtocol {
    func addFavorite(_ item: ProductListModel?) {
        guard let item else { return }
        presenter?.addItem(item)
        print(item)
    }
    
    func addBasket(_ item: ProductListModel?) {
        guard let item else { return }
        presenter?.addItem(item)
        print(item)
    }
}

