//
//  MenuInteractor.swift
//  YappeViperTest
//

//

import Foundation
import UIKit

protocol MenuBusinessLogic {
    func getInfoProductosMenuInteractor()
    func getInfoProductosMenuInteractorMVVM()
}

protocol MenuDataStore {

}

class MenuInteractor: MenuBusinessLogic, MenuDataStore {

    // MARK: - Attributes
    var api: WebServicesProtocol?
    var presenter: MenuPresentationLogic?
    var worker: MenuWorkerProtocol?

    // MARK: - MenuDataStore

    // MARK: - MenuBusinessLogic
    func getInfoProductosMenuInteractorMVVM(){
        webServicesMenu().getArticles() { [self] articles in
            if let articles = articles {
                print(articles)
                var productosLista: [ProductosMenu]=[]
                for item in articles {
                    print(item.id)
                    productosLista.append(ProductosMenu(id: item.id, name: item.name, desc: item.desc, price: item.price, image: item.image, page: item.page, latitude: item.latitude, longitude: item.longitude))
                }
                presenter?.presentViewInfoMenuInfo(productosLista)
            }
        }
    }
    func getInfoProductosMenuInteractor() {
       // presenter.presentViewInfoMenuInfo()
        worker?.getProductosMenuEntity(completionHandler: { [self]
        (response: [ProductosList]?, error: String?) in
            if response != nil {
            let productosLista: [ProductosMenu]=[]
            presenter?.presentViewInfoMenuInfo(productosLista)

        } else {
            print("worker.getProductosMenuEntity request failed!")
           // completionHandler(false, nil, nil)
        }
    })
    
    }
}
