//
//  ProductListCell.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import UIKit

protocol ProductListCellDelegateProtocol: AnyObject {
    func addFavorite(_ item: ProductListModel?)
    func addBasket(_ item: ProductListModel?)
}

final class ProductListCell: UICollectionViewCell {

    static var reuseIdentifier: String = Constants.reuseId
    private var isActiveFavorite: Bool = false
    private var isActiveBasket: Bool = false
    private var item: ProductListModel?
    weak var delegate: ProductListCellDelegateProtocol?

    private struct Constants {
        static let cornerRadius: CGFloat = 6
        static let offset: CGFloat = 10
        static let imageHeight: CGFloat = 50
        static let priceFontSize: CGFloat = 20
        static let descriptionFontSize: CGFloat = 15
        static let basketIsActiveImageName = "basket.fill"
        static let basketImageName = "basket"
        static let favoriteIsActiveImageName = "heart.fill"
        static let favoriteImageName = "heart"
        static let reuseId = "ProductListCell"
    }

    private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = Constants.cornerRadius
        return image
    }()

    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Constants.priceFontSize)
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Constants.descriptionFontSize)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private var basketButton: UIButton = {
        let button = UIButton()
        let image = UIImage(
            systemName: Constants.basketImageName
        )?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()

    private var favoriteButton: UIButton = {
        let button = UIButton()
        let image = UIImage(
            systemName: Constants.favoriteImageName
        )?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Setup UI

extension ProductListCell {
    func setupViews() {
        layer.cornerRadius = Constants.cornerRadius

        [imageView, priceLabel, descriptionLabel, basketButton, favoriteButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        basketButton.addTarget(self, action: #selector(addBasket), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        NSLayoutConstraint.activate(makeConstraints())
    }

    private func makeConstraints() -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: makeImageViewConstrainst())
        constraints.append(contentsOf: makePriceLabelConstrainst())
        constraints.append(contentsOf: makeDescriptionLabelConstrainst())
        constraints.append(contentsOf: makeBasketButtonConstrainst())
        constraints.append(contentsOf: makeFavoriteButtonConstrainst())
        return constraints
    }

    private func makeImageViewConstrainst() -> [NSLayoutConstraint] {
        return [
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.offset * 2),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.offset * 2),
            trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: Constants.offset * 2),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ]
    }

    private func makePriceLabelConstrainst() -> [NSLayoutConstraint] {
        return [
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.offset),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.offset),
            trailingAnchor.constraint(equalTo: basketButton.trailingAnchor, constant: Constants.offset),
            bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: Constants.offset)
        ]
    }

    private func makeDescriptionLabelConstrainst() -> [NSLayoutConstraint] {
        return [
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.offset),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.offset),
            favoriteButton.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: Constants.offset)
        ]
    }

    private func makeBasketButtonConstrainst() -> [NSLayoutConstraint] {
        return [
            basketButton.topAnchor.constraint(equalTo: favoriteButton.bottomAnchor, constant: Constants.offset),
            trailingAnchor.constraint(equalTo: basketButton.trailingAnchor, constant: Constants.offset),
        ]
    }

    private func makeFavoriteButtonConstrainst() -> [NSLayoutConstraint] {
        return [
            favoriteButton.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: Constants.offset),
            trailingAnchor.constraint(equalTo: favoriteButton.trailingAnchor, constant: Constants.offset),
        ]
    }
}

// MARK: Configure UI

extension ProductListCell {
    func configure(_ cell: ProductListModel) {
        item = cell
        imageView.image = UIImage(named: cell.imageName ?? "")
        priceLabel.text = cell.price
        descriptionLabel.text = cell.descript
    }
}

// MARK: Configure Target

extension ProductListCell {
    @objc
    private func addFavorite() {
        isActiveFavorite.toggle()
        let imageFill = UIImage(systemName: Constants.favoriteIsActiveImageName)?.withTintColor(.red, renderingMode: .alwaysOriginal)
        let imageNotFill = UIImage(systemName: Constants.favoriteImageName)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let image = isActiveFavorite
        ? imageFill
        : imageNotFill
        favoriteButton.setImage(image, for: .normal)
        item?.isHaveFavorite = isActiveFavorite
        delegate?.addFavorite(item)
    }

    @objc
    private func addBasket() {
        isActiveBasket.toggle()
        let imageFill = UIImage(systemName: Constants.basketIsActiveImageName)?.withTintColor(.red, renderingMode: .alwaysOriginal)
        let imageNotFill = UIImage(systemName: Constants.basketImageName)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let image = isActiveBasket
        ? imageFill
        : imageNotFill
        basketButton.setImage(image, for: .normal)
        item?.isHaveBasket = isActiveBasket
        delegate?.addBasket(item)
    }
}
