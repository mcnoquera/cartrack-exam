//
//  UserDetailsViewController.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/21/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class UserDetailsViewController: UITableViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    fileprivate let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }()
    
    let regionInMeters: Double = 10000
    
    lazy var viewModel = { [weak self] in
        return  UserViewModel()
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel.userNameText
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: CTColor.purple]
        self.navigationController?.navigationBar.tintColor = CTColor.purple
        
        self.nameLabel.text = viewModel.nameText
        self.descriptionLabel.text = [viewModel.userNameText, " | ", viewModel.companyNameText].joined()
        self.phoneNumberLabel.text = [viewModel.phoneText, " | ", viewModel.emailText].joined()
        self.websiteLabel.text = viewModel.websiteText
        self.addressLabel.text = [viewModel.streetText, ", ", viewModel.suiteText, " ", viewModel.cityText, " | ", viewModel.zipCodeText].joined()
        
        setUpMapView()
        
    }
    
    //MARK: - Setup Methods
    func setUpMapView() {
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.showsScale = true
        setPinUsingMKPointAnnotation(location: CLLocationCoordinate2D(latitude: viewModel.geoLatValue, longitude: viewModel.geoLongValue))
    }
    
    func setPinUsingMKPointAnnotation(location: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "\(viewModel.userNameText) - Location"
        annotation.subtitle = "Device Location"
        let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(annotation)
    }
}

