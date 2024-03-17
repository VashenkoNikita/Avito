//
//  TabBarRouterProtocol.swift
//  Avito
//
//  Created by Nikita on 10.03.2024.
//

import UIKit

protocol TabBarRouterProtocol: AnyObject {
    static func createModule() -> UIViewController

    // Методы для переходов
}
