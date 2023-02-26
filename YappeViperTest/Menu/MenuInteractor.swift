//
//  MenuInteractor.swift
//  YappeViperTest
//

//

//import Commons
//import AppKitBCI

protocol MenuBusinessLogic {
    func getInfoProductosMenuInteractor()
}

protocol MenuDataStore {

}

class MenuInteractor: MenuBusinessLogic, MenuDataStore {

    // MARK: - Attributes

    var presenter: MenuPresentationLogic?
    var worker: MenuWorkerProtocol?

    // MARK: - MenuDataStore

    // MARK: - MenuBusinessLogic
    
    func getInfoProductosMenuInteractor() {
        
       // presenter.presentViewInfoMenuInfo()
    }
}
