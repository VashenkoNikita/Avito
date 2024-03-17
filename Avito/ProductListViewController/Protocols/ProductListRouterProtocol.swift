//
//  ProductListRouterProtocol.swift
//  Avito
//
//  Created by Nikita on 16.03.2024.
//

import UIKit

protocol ProductListRouterProtocol: AnyObject {
    static func createModule() -> UIViewController

    func showDetailScreen()
}
