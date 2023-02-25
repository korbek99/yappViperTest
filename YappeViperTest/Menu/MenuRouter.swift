//
//  MenuRouter.swift
//  YappeViperTest
//

//

import UIKit

@objc protocol MenuRoutingLogic {
    func routeToDetails()
}

protocol MenuDataPassing {
    var dataStore: MenuDataStore? { get }
}

class MenuRouter: NSObject, MenuRoutingLogic, MenuDataPassing {

    weak var viewController: MenuViewController?
    var dataStore: MenuDataStore?

    // MARK: - Routing

    // MARK: - Passing data

    //func passDataToSomewhere(source: MenuDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
    
    func routeToDetails() {
       self.viewController?.navigationController?.popToRootViewController(animated: true)
    }
}
