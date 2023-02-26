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

    lazy var tableView: UITableView = {
        let table: UITableView = .init()
        table.delegate = self
        table.dataSource = self
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var btnVerMapas: UIButton = {
        let button: UIButton = .init()
        button.backgroundColor = .blue
        button.setTitle("Ver Mapa", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Attributes
    
    var nombreString:String?
    var decripString:String?
    var imageString:String?
    var precio:String?
    var latitud:String?
    var lontitud:String?
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtonMapa()
        setUpTableViewregister()
    }

    // MARK: - Private

    private func setUpButtonMapa() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Ir a Mapa",
            style: .plain,
            target: self,
            action: #selector(irMapaMarket(sender:))
        )
    }
    private func setUpTableViewregister() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: "HeaderTableViewCell")
        tableView.register(BodyTableViewCell.self, forCellReuseIdentifier: "BodyTableViewCell")
        tableView.register(FooterTableViewCell.self, forCellReuseIdentifier: "FooterTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpTableView() {
         view.addSubview(tableView)
         tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
     }
    private func goToMapaView(){
        let storyboard = self.storyboard?.instantiateViewController(identifier: "MenuMapaViewController") as! MenuMapaViewController
        storyboard.latitudMap = latitud
        storyboard.lontitudMap = lontitud
        storyboard.lugarString = nombreString
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
    // MARK: - Actions
    @objc func irMapaMarket(sender: UIBarButtonItem) {
       // goToMapaView()
        router?.routeToMenuMapa(latitud: latitud!, lontitud: lontitud!, nombreString: nombreString!)
    }
    // MARK: - Public

    // MARK: - Actions

    // MARK: - MenuDetailsDisplayLogic
}


extension MenuDetailsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            cell.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
            cell.configure(HeaderTableViewModel(name: String(nombreString!), title: String(decripString!), precio: String(precio!)))
                    return cell
                }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BodyTableViewCell") as! BodyTableViewCell
            cell.heightAnchor.constraint(equalToConstant: 280.0).isActive = true
            cell.isUserInteractionEnabled = false
            cell.configure(BodyTableViewModel(urlImg: imageString!))
           
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTableViewCell") as! FooterTableViewCell
            cell.isUserInteractionEnabled = false
            cell.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
            return cell
        }
    }
}
