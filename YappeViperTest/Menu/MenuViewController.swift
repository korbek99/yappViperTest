//
//  MenuViewController.swift
//  YappeViperTest
//
//import Commons
//import AppKitBCI
import UIKit

struct ViewModelError {
    let title: String
    let message: String
    let icon: UIImage?
    let code: String
    var animated: Bool = true
}

protocol MenuDisplayLogic: AnyObject {
     func startloading()
     func stoploading()
     func displayConnectionError(viewModel: ViewModelError)
     func displayViewTextsInfo(listaProductos: [ProductosMenu])
     func displayConnectionError(viewModel: APIErrorViewModel)
     func displayDiscountNotFoundError(viewModel: APIErrorViewModel)
    
}

class MenuViewController: UIViewController, MenuDisplayLogic {

    var interactor: MenuBusinessLogic?
    var router: (NSObjectProtocol & MenuRoutingLogic & MenuDataPassing)?

    // MARK: - Object lifecycle

    // MARK: - init
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
        let interactor = MenuInteractor()
        let presenter = MenuPresenter()
        let router = MenuRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - IBOutlets
    
    lazy var tableView: UITableView = {
        let table: UITableView = .init()
        table.delegate = self
        table.dataSource = self
        table.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        table.rowHeight = 200.0
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - Attributes
    public var listProducts: [ProductosMenu] = []
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setUpTableView()
    }

    // MARK: - Private
    private func setUpTableView() {
         view.addSubview(tableView)
         tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
     }
    // MARK: - Public
    func displayConnectionError(viewModel: ViewModelError){
    
    }
    public func startloading(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: nil)
    }
    
    public func stoploading(){
        self.dismiss(animated: false, completion: nil)
    }
    // MARK: - Actions
    @objc func retryFetchData(sender: AnyObject) {
        //goToMapaView()
    }
    // MARK: - MenuDisplayLogic
    
    func displayViewTextsInfo(listaProductos: [ProductosMenu]) {
        for items in listaProductos {
            listProducts.append(ProductosMenu(id: items.id,
                                              name: items.name,
                                              desc: items.desc,
                                              price: items.price,
                                              image: items.image,
                                              page: items.page,
                                              latitude: items.latitude,
                                              longitude: items.longitude))
        }
        self.tableView.reloadData()
    }
    
    func displayDiscountNotFoundError(viewModel: APIErrorViewModel) {
//        errorView = FullScreenMessageError(
//            withTitle: viewModel.title,
//            message: viewModel.message,
//            image: BciAsset.sinConexion.image,
//            buttonsTitles: "UNDERSTOOD"],
//            buttonsActions: [#selector(retryFetchData)],
//            buttonsStyles: [UIButton.ButtonTypes.basic],
//            target: self,
//            showHeader: true
//        )
//        errorView?.addAccesibilityIdentifierForAllElements(
//            withIdentifier: "DescuentosListViewController.FetchDiscountsDiscountNotFound")
//        view.addSubview(errorView!)
//        view.layoutIfNeeded()
    }
    func displayConnectionError(viewModel: APIErrorViewModel) {
//        errorView = FullScreenMessageError(
//            withTitle: viewModel.title,
//            message: viewModel.message,
//            image: BciAsset.sinConexion.image,
//            buttonsTitles: "RETRY", "CANCEL"],
//            buttonsActions: [#selector(retryFetchData), #selector(closeView)],
//            buttonsStyles: [UIButton.ButtonTypes.basic, UIButton.ButtonTypes.cancel],
//            target: self,
//            showHeader: true
//        )
//        errorView?.addAccesibilityIdentifierForAllElements(
//            withIdentifier: "SearchDescuentosViewController.FetchAccountsNoInternetError"
//        )
//        view.addSubview(errorView!)
//        view.layoutIfNeeded()
    }
}
extension MenuViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell()
        return cell
    }
}

