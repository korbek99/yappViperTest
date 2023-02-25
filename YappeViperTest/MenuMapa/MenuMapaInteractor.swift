//
//  MenuMapaInteractor.swift
//  YappeViperTest
//
//  Copyright © 2021 Banco de Crédito e Inversiones. All rights reserved.
//



protocol MenuMapaBusinessLogic {

}

protocol MenuMapaDataStore {

}

class MenuMapaInteractor: MenuMapaBusinessLogic, MenuMapaDataStore {

    // MARK: - Attributes

    var presenter: MenuMapaPresentationLogic?
    var worker: MenuMapaWorkerProtocol?
    //var analyticsService: GoogleAnalyticsInteractor?

    // MARK: - MenuMapaDataStore

//    init(
//        analyticsService: GoogleAnalyticsInteractor = GoogleAnalyticsServiceInteractor()
//        ) {
//        worker = MenuMapaWorker()
//        self.analyticsService = analyticsService
//    }

    // MARK: - MenuMapaBusinessLogic
}
