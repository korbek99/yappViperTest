//
//  MenuDetailsRouter.swift
//  YappeViperTest
//


import UIKit

@objc protocol MenuDetailsRoutingLogic {
}

protocol MenuDetailsDataPassing {
    var dataStore: MenuDetailsDataStore? { get }
}

class MenuDetailsRouter: NSObject, MenuDetailsRoutingLogic, MenuDetailsDataPassing {

    weak var viewController: MenuDetailsViewController?
    var dataStore: MenuDetailsDataStore?

    // MARK: - Routing

    // MARK: - Passing data

    //func passDataToSomewhere(source: MenuDetailsDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
