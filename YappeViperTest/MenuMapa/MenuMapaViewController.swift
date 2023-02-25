//
//  MenuMapaViewController.swift
//  YappeViperTest
//


import UIKit
import MapKit

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

    @IBOutlet weak var mapaKit: MKMapView!
    // MARK: - Attributes
    
    var latitudMap:String?
    var lontitudMap:String?
    var lugarString:String?

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapUI()
        loadMap()
    }

    // MARK: - Private
    
    private  func setupMapUI(){
        mapaKit.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapaKit)
        mapaKit.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapaKit.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapaKit.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapaKit.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    private  func loadMap(){
        let lon = Double(lontitudMap!)
        let lat = Double(latitudMap!)
        let mapi = MKPointAnnotation()
        mapi.title = "Ubicacion  : "  + lugarString!
        mapi.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
        mapaKit.addAnnotation(mapi)
        mapaKit.mapType = .standard
        mapaKit.showsUserLocation = true
        mapaKit.showsScale = true
        mapaKit.showsCompass = true
        updateUI()
        mapaKit.setZoomByDeltas(delta: 0.5, animated: true)
        updateUI()
    }
    private func centerMapOnLocation(_ location: CLLocation, mapView: MKMapView) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    private func updateUI() {
        let longitudes = Double(lontitudMap!)
        let latitudes = Double(latitudMap!)
        let oahuCenter = CLLocation(latitude: latitudes!, longitude: longitudes!)
        let region = MKCoordinateRegion(
         center: oahuCenter.coordinate,
         latitudinalMeters: 300,
         longitudinalMeters: 300)
        mapaKit.setCameraBoundary(
         MKMapView.CameraBoundary(coordinateRegion: region),
         animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 1000)
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard annotation is MKPointAnnotation else { return nil }

            let identifier = "Annotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
            } else {
                annotationView!.annotation = annotation
            }

            return annotationView
        }
    }
    // MARK: - Public

    // MARK: - Actions

    // MARK: - MenuMapaDisplayLogic
    
   
}
extension MKMapView {
    func setZoomByDeltas(delta: Double, animated: Bool) {
        var _region = region;
        var _span = region.span;
        _span.latitudeDelta *= delta;
        _span.longitudeDelta *= delta;
        _region.span = _span;

        setRegion(_region, animated: animated)
    }
}

