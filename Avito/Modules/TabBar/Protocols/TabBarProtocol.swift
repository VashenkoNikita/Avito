//
//  TabBarProtocol.swift
//  Avito
//
//  Created by Nikita on 10.03.2024.
//

import UIKit

protocol TabBarViewProtocol: AnyObject {
    //root view presenter
    var presenter: TabBarPresenterProtocol? { get }
}
