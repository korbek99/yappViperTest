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
    let code: EcosistemaServiceErrorCode
    var animated: Bool = true
}

protocol MenuDisplayLogic: AnyObject {
     func startloading()
     func stoploading()
     func displayConnectionError(viewModel: ViewModelError)
    
}

class MenuViewController: UIViewController, MenuDisplayLogic {

    var interactor: MenuBusinessLogic?
    var router: (NSObjectProtocol & MenuRoutingLogic & MenuDataPassing)?

    // MARK: - Object lifecycle

//    init() {
//        super.init(
//            nibName: "MenuViewController",
//            bundle: Utils.bundle(forClass: MenuViewController.classForCoder())
//        )
//        setup()
//    }
//
//     init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        setup()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setup()
//    }
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
    func displayConnectionError(viewModel: ViewModelError)
    
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

    // MARK: - MenuDisplayLogic
}
extension MenuViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell()
        return cell
    }
}

