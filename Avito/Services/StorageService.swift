//
//  StorageService.swift
//  Avito
//
//  Created by Nikita on 17.03.2024.
//

import SwiftData

protocol StorageServiceProtocol {
    func insertProductFavorite(_ product: ProductListModel)
    func insertProductBasket(_ product: ProductListModel)
    func insertProduct(_ product: ProductListModel)
    func removeProductBasket(_ product: ProductListModel)
    func removeProductFavorite(_ product: ProductListModel)
    func loadProducts() -> [ProductListModel]
    func loadProductsFavorite() -> [ProductListModel]
    func loadProductsBasket() -> [ProductListModel]
}

final class StorageService {
    private let modelContainer: ModelContainer?

    init() {
        modelContainer = try? ModelContainer(for: ProductListModel.self)
    }
}

//MARK: StorageServiceProtocol

extension StorageService: StorageServiceProtocol {
    @MainActor 
    func loadProducts() -> [ProductListModel] {
        let descriptor = FetchDescriptor<ProductListModel>()
        guard let products = try? modelContainer?.mainContext.fetch(descriptor) else {
            return []
        }
        return products
    }

    @MainActor
    func loadProductsFavorite() -> [ProductListModel] {
        let descriptor = FetchDescriptor<ProductListModel>()
        guard let products = try? modelContainer?.mainContext.fetch(descriptor) else {
            return []
        }
        return products
    }

    @MainActor
    func loadProductsBasket() -> [ProductListModel] {
        let descriptor = FetchDescriptor<ProductListModel>()
        guard let products = try? modelContainer?.mainContext.fetch(descriptor) else {
            return []
        }
        return products
    }

    @MainActor
    func insertProduct(_ product: ProductListModel) {
        modelContainer?.mainContext.insert(product)
    }

    @MainActor
    func insertProductFavorite(_ product: ProductListModel) {
        // modelContainerFavorite?.mainContext.insert(product)
    }
    
    @MainActor 
    func insertProductBasket(_ product: ProductListModel) {
       //  modelContainerBasket?.mainContext.insert(product)
    }
    
    @MainActor 
    func removeProductBasket(_ product: ProductListModel) {
       //  modelContainerBasket?.mainContext.delete(product)
    }
    
    @MainActor 
    func removeProductFavorite(_ product: ProductListModel) {
       // modelContainerFavorite?.mainContext.delete(product)
    }
}
