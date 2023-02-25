//
//  MenuMapaViewController.swift
//  YappeViperTest
//


import UIKit


protocol MenuMapaDisplayLogic: AnyObject {

}

class MenuMapaViewController: UIViewController, MenuMapaDisplayLogic {

    var interactor: MenuMapaBusinessLogic?
    var router: (NSObjectProtocol & MenuMapaRoutingLogic & MenuMapaDataPassing)?

    // MARK: - Object lifecycle

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup

    private func setup() {
        let viewController = self
        let interactor = MenuMapaInteractor()
        let presenter = MenuMapaPresenter()
        let router = MenuMapaRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - IBOutlets

    // MARK: - Attributes

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Private

    // MARK: - Public

    // MARK: - Actions

    // MARK: - MenuMapaDisplayLogic
}
