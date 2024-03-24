//
//  ProductListStorage.swift
//  Avito
//
//  Created by Nikita on 17.03.2024.
//

protocol ProductListStorageProtocol: AnyObject {
    func insertProducts(_ product: ProductListModel)
    func removeProduct(_ product: ProductListModel)
    func loadProducts() -> [ProductListModel]
    func deleteAllProducts()
}

final class ProductListStorage {
    private let storageService = SwiftDataManager<ProductListModel>(model: ProductListModel.self)
}

//MARK: ProductListStorageProtocol

extension ProductListStorage: ProductListStorageProtocol {

    @MainActor
    func loadProducts() -> [ProductListModel] {
        storageService.loadObject()
    }

    @MainActor
    func insertProducts(_ product: ProductListModel) {
        storageService.insertObject(product)
    }
    
    @MainActor
    func removeProduct(_ product: ProductListModel) {
        storageService.removeObject(product)
    }
    
    @MainActor
    func deleteAllProducts() {
        storageService.deleteAllData()
    }
}
