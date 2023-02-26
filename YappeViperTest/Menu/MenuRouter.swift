//
//  MenuRouter.swift
//  YappeViperTest
//

//

import UIKit
struct routerMenuViewModel {
    let name: String
    let imagen: String
    let desc: String
    let precio: String
    let latitud: String
    let lontitud: String
    init(name: String,
         imagen: String,
         desc: String,
         precio: String,
         latitud: String,
         lontitud: String) {
        self.name = name
        self.imagen = imagen
        self.desc = desc
        self.precio = precio
        self.latitud = latitud
        self.lontitud = lontitud
    }
}
@objc protocol MenuRoutingLogic {
    func routeToDetails()
    func routeToDetailsMenu(nombre: String,
                            image: String,
                            decrip: String,
                            precio: String,
                            latitud: String,
                            lontitud: String)
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
    func routeToDetailsMenu(nombre: String,
                     image: String,
                     decrip: String,
                     precio: String,
                     latitud: String,
                     lontitud: String){
    let VC = MenuDetailsViewController()
    VC.nombreString = nombre
    VC.imageString = image
    VC.decripString = decrip
    VC.precio = "$" + precio
    VC.latitud = latitud
    VC.lontitud = lontitud
    self.viewController?.navigationController?.pushViewController(VC, animated: true)
    }
 
}
