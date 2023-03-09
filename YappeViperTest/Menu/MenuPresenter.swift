//
//  MenuPresenter.swift
//  YappeViperTest
//
//

import UIKit

protocol MenuPresentationLogic {
    func presentViewInfoMenuInfo(_ response: [ProductosMenu])
    func presentServiceError(response: APIErrorResponse)
    func presentConnectionError()
    func presentGoToProductos()
}

class MenuPresenter: MenuPresentationLogic {

    weak var viewController: MenuDisplayLogic?
    var interactor: MenuBusinessLogic?

    // MARK: - MenuPresentationLogic
    
    func presentGoToProductos() {
        interactor?.getInfoProductosMenuInteractor()
    }
    func presentViewInfoMenuInfo(_ response: [ProductosMenu]) {
        if response.isEmpty{
            let viewModel = APIErrorViewModel(
                title: "hubo un error",
                message: "ocurrio un error de servicio",
                icon: "icp_service_problem",
                code: "service_problem",
                animated: true
            )
            viewController?.displayConnectionError(viewModel: viewModel)
        }else{
            viewController?.displayViewTextsInfo(listaProductos: response)
        }
        
    }
    func presentServiceError(response: APIErrorResponse) {
        
        let viewModel = APIErrorViewModel(
            title: response.title,
            message: response.message,
            icon: "icp_service_problem",
            code: "service_problem",
            animated: true
        )
        viewController?.displayDiscountNotFoundError(viewModel: viewModel)
    }
    func presentConnectionError() {
        let viewModel = APIErrorViewModel(
            title: "NO_INTERNET_TITLE",
            message: "PROBLEM_SORRY",
            icon: "error",
            code: "unknown",
            animated: true
        )
        viewController?.displayConnectionError(viewModel: viewModel)
    }
}
