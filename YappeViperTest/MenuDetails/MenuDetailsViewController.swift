//
//  MenuDetailsViewController.swift
//  YappeViperTest
//


import UIKit

protocol MenuDetailsDisplayLogic: AnyObject {

}

class MenuDetailsViewController: UIViewController, MenuDetailsDisplayLogic {

    var interactor: MenuDetailsBusinessLogic?
    var router: (NSObjectProtocol & MenuDetailsRoutingLogic & MenuDetailsDataPassing)?

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
        let interactor = MenuDetailsInteractor()
        let presenter = MenuDetailsPresenter()
        let router = MenuDetailsRouter()
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

    // MARK: - MenuDetailsDisplayLogic
}
