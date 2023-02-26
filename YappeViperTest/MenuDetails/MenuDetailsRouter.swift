//
//  MenuDetailsRouter.swift
//  YappeViperTest
//


import UIKit

@objc protocol MenuDetailsRoutingLogic {
    func routeToMenuMapa(latitud:String ,lontitud:String ,nombreString:String )
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
    func routeToMenuMapa(latitud:String ,lontitud:String ,nombreString:String ) {
        let ViewController = MenuMapaViewController()
        ViewController.latitudMap = latitud
        ViewController.lontitudMap = lontitud
        ViewController.lugarString = nombreString
        self.viewController?.navigationController?.pushViewController(ViewController, animated: true)
    }

}
