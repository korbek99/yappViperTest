//
//  MenuInteractor.swift
//  YappeViperTest
//

//

//import Commons
//import AppKitBCI

protocol MenuBusinessLogic {

}

protocol MenuDataStore {

}

class MenuInteractor: MenuBusinessLogic, MenuDataStore {

    // MARK: - Attributes

    var presenter: MenuPresentationLogic?
    var worker: MenuWorkerProtocol?
   // var analyticsService: GoogleAnalyticsInteractor?

    // MARK: - MenuDataStore
//
//    init(
//        analyticsService: GoogleAnalyticsInteractor = GoogleAnalyticsServiceInteractor()
//        ) {
//        worker = MenuWorker()
//        self.analyticsService = analyticsService
//    }

    // MARK: - MenuBusinessLogic
}
