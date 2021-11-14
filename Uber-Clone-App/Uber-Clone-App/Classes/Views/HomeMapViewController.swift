//
//  HomeMapViewController.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 07/11/21.
//

import UIKit
import MapKit

final class HomeMapViewController: UIViewController {
    
    //MARK: - Properties:
    
    private let locationService: LocationServiceInheritanceTA = LocationService()
    
    private lazy var menuButton: UIButton = .configureMenuHanburgerButton()
    private lazy var locationViewText: LocationInpuActivationView = .init()
    private lazy var mapView: MKMapView = .init()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationViewText.animateIntro()
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        configureMap()
        
        configureViewHierarchy()
        configureConstraints()
        
        locationViewText.delegate = self
        menuButton.addTarget(self, action: #selector(menuButtonHandleTapped), for: .touchUpInside)
    }
    
    private func configureViewHierarchy() {
        [mapView, locationViewText,  menuButton].forEach { view.addSubview($0) }
    }
    
    private func configureConstraints() {
        mapView.configureContstaints(top: view.topAnchor, leading: view.leadingAnchor,
                                     trailing: view.trailingAnchor, bottom: view.bottomAnchor)
        
        menuButton.configureContstaints(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor,
                                        paddingTop: 20, paddingLeading: 20)
        
        locationViewText.configureContstaints(top: menuButton.bottomAnchor, centerX: view.centerXAnchor,
                                              paddingTop: 20, height: 50,
                                              width: (view.frame.width * 0.85))
    }
    
    private func configureMap() {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        locationService.enableLocationManager()
    }

    
    //MARK: - Selectors
    
    @objc private func menuButtonHandleTapped() {
        do {
            try AUTH.signOut()
            self.present(UberRouter.routeToSingInNav(), animated: true, completion: nil)
            
        } catch {
            print("DEBUG: Error Signing out")
        }
    }
    
}

extension HomeMapViewController: LocationInpuActivationViewDelegate {
    func LocationInputLocationViewTapped() {
        print("Tururuu")
        self.present(UberRouter.routeToLocationInputViewController(), animated: true, completion: nil)
        
    }
}
