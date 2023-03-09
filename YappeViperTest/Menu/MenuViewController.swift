//
//  MenuViewController.swift
//  YappeViperTest
//

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
        startloading()
        interactor?.getInfoProductosMenuInteractorMVVM()
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
        let alertError = UIAlertController(title: nil, message: viewModel.message, preferredStyle: .alert)
        let okAction = UIAlertAction (title: "ACEPTAR", style: UIAlertAction.Style.cancel, handler: nil)
        alertError.addAction(okAction)
        self.present(alertError, animated: true, completion: nil)
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
    @objc func closeAlertError(sender: AnyObject) {
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
        DispatchQueue.main.async { [self] in
            self.tableView.reloadData()
            stoploading()
        }
    }
    
    func displayDiscountNotFoundError(viewModel: APIErrorViewModel) {

    }
    func displayConnectionError(viewModel: APIErrorViewModel) {

    }
}
extension MenuViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as? MenuTableViewCell else { return UITableViewCell() }        
        cell.configure(MenuTableViewCellModel(name: listProducts[indexPath.row].name, title: listProducts[indexPath.row].desc, precio: String(listProducts[indexPath.row].price), imagen: listProducts[indexPath.row].image))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.router?.routeToDetailsMenu(nombre: listProducts[indexPath.row].name, image: String(listProducts[indexPath.row].image), decrip: listProducts[indexPath.row].desc, precio: String(listProducts[indexPath.row].price), latitud: listProducts[indexPath.row].latitude, lontitud: listProducts[indexPath.row].longitude)
    }
}

