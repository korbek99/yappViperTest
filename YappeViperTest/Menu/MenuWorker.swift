//
//  MenuWorker.swift
//  YappeViperTest
//

//

import UIKit

protocol MenuWorkerProtocol {
    func getProductosMenuEntity(completionHandler: @escaping ([ProductosList]?, String?) -> Void)
}
class MenuWorker: MenuWorkerProtocol {
    let services = MenuAPI()
//    private let api: WebServicesProtocol?
//    init(_ api: WebServicesProtocol = webServicesMenu() as! WebServicesProtocol) {
//        self.api = api
//    }
   // var interactor : RegistroEntityToInteractor? = nil
    
     func getProductosMenuEntity(completionHandler: @escaping ([ProductosList]?, String?) -> Void){
        services.requestData(endpointName: "crearIssue", method: .get) { response in
            guard let data = try? ApiWrapper<String>.decode(response)
            else {
               // self.interactor?.showError(error: "No hay conexión a internet")
                //MARK: - Analitica: Error de conexió
                return
            }
            if(data.status == "Failed") {
                //self.interactor?.showError(error: data.payload!)
                return
            }

        }
    }
}
