//
//  MenuDetailsInteractor.swift
//  YappeViperTest
//

import UIKit


protocol MenuDetailsBusinessLogic {

}

protocol MenuDetailsDataStore {

}

class MenuDetailsInteractor: MenuDetailsBusinessLogic, MenuDetailsDataStore {

    // MARK: - Attributes

    var presenter: MenuDetailsPresentationLogic?
    var worker: MenuDetailsWorkerProtocol?
    //var analyticsService: GoogleAnalyticsInteractor?

    // MARK: - MenuDetailsDataStore

//    init(
//        analyticsService: GoogleAnalyticsInteractor = GoogleAnalyticsServiceInteractor()
//        ) {
//        worker = MenuDetailsWorker()
//        self.analyticsService = analyticsService
//    }

    // MARK: - MenuDetailsBusinessLogic
}
