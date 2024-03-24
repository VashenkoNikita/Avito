//
//  SwiftDataManager.swift
//  Avito
//
//  Created by Nikita on 17.03.2024.
//

import SwiftData

protocol SwiftDataProtocol {
    associatedtype Model
    func insertObject<T>(_ object: T) where T : PersistentModel
    func removeObject<T>(_ object: T) where T : PersistentModel
    func loadObject() -> [Model]
    func deleteAllData()
}

final class SwiftDataManager<Model> where Model : PersistentModel {
    private let modelContainer: ModelContainer?

    init(model: any PersistentModel.Type) {
        modelContainer = try? ModelContainer(for: model)
    }
}

extension SwiftDataManager: SwiftDataProtocol {

    @MainActor
    func insertObject<T>(_ object: T) where T : PersistentModel {
        modelContainer?.mainContext.insert(object)
    }
    @MainActor
    func removeObject<T>(_ object: T) where T : PersistentModel {
        modelContainer?.mainContext.delete(object)
    }
    
    @MainActor
    func loadObject() -> [Model] {
        let descriptor = FetchDescriptor<Model>()
        guard let object = try? modelContainer?.mainContext.fetch(descriptor) else {
            return []
        }
        return object
    }

    func deleteAllData() {
        modelContainer?.deleteAllData()
    }
}
