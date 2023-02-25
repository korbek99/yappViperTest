//
//  MenuMapaRouter.swift
//  YappeViperTest
//


import UIKit

@objc protocol MenuMapaRoutingLogic {
}

protocol MenuMapaDataPassing {
    var dataStore: MenuMapaDataStore? { get }
}

class MenuMapaRouter: NSObject, MenuMapaRoutingLogic, MenuMapaDataPassing {

    weak var viewController: MenuMapaViewController?
    var dataStore: MenuMapaDataStore?

    // MARK: - Routing

    // MARK: - Passing data

    //func passDataToSomewhere(source: MenuMapaDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
