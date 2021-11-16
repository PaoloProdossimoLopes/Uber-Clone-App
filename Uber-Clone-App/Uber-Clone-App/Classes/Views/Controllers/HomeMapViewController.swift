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
    private var statusBarStyle: UIStatusBarStyle = .lightContent
    
    private lazy var menuButton: UIButton = .configureMenuHanburgerButton()
    private lazy var locationViewText: LocationInpuActivationView = .init()
    private lazy var locationInputView: LocationInputView = .init()
    
    private let tableView: UITableView = .init()
    
    private final let locationCellHight: CGFloat = 200
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationViewText.animateIntro()
        configureStatusBar(false)
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
        [locationService.mapView, locationViewText,  menuButton].forEach { view.addSubview($0) }
    }
    
    private func configureConstraints() {
        locationService.mapView.configureContstaints(top: view.topAnchor, leading: view.leadingAnchor,
                                     trailing: view.trailingAnchor, bottom: view.bottomAnchor)
        
        menuButton.configureContstaints(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor,
                                        paddingTop: 20, paddingLeading: 20)
        
        locationViewText.configureContstaints(top: menuButton.bottomAnchor, centerX: view.centerXAnchor,
                                              paddingTop: 20, height: 50,
                                              width: (view.frame.width * 0.85))
    }
    
    private func configureMap() {
        locationService.mapView.showsUserLocation = true
        locationService.mapView.userTrackingMode = .follow
        
        locationService.enableLocationManager()
    }
    
    private func configureLocationInputView() {
        locationInputView.alpha = 0
        locationInputView.delegate = self
        view.addSubview(locationInputView)
        
        locationInputView.configureContstaints(top: view.topAnchor,
                                               leading: view.leadingAnchor, trailing: view.trailingAnchor,
                                               height: locationCellHight)
        configureStatusBar(true)
        
        UIView.animate(withDuration: 0.2) { self.locationInputView.alpha = 1 } completion: { _ in
            DEBUGMessage("Present table view")
            self.configureTableView()
        }
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let tableViewHieght = (view.frame.height - locationCellHight)
        tableView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: tableViewHieght)
        
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
        
        UIView.animate(withDuration: 0.3) {
            self.tableView.frame = CGRect(x: 0, y: self.view.frame.height - tableViewHieght, width: self.view.frame.width, height: tableViewHieght)
        }
        
    }
    
    private func dissmissalTableView() {
        let tableViewHieght = (view.frame.height - locationCellHight)
        
        UIView.animate(withDuration: 0.3) {
            self.tableView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width,
                                          height: tableViewHieght)
        } completion: { _ in
            self.tableView.removeFromSuperview()
        }
        
    }
    
    private func configureStatusBar(_ light: Bool) {
        statusBarStyle = light ? .darkContent : .lightContent
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }

    
    //MARK: - Selectors
    
    @objc private func menuButtonHandleTapped() {
        do {
            try AUTH.signOut()
            self.present(UberRouter.routeToSingInNav(), animated: true, completion: nil)
            
        } catch {
            DEBUGMessage("Error Signing out")
        }
    }
    
}

extension HomeMapViewController: LocationInpuActivationViewDelegate {
    func LocationInputLocationViewTapped() {
        DEBUGMessage("Configure location input view ...")
        locationViewText.alpha = 0
        configureLocationInputView()
    }
}

extension HomeMapViewController: LocationInputViewDelegate {
    func closeButtonHandleTapped() {
        
        configureStatusBar(false)
        locationInputView.alpha = 1
        self.dissmissalTableView()
        
        UIView.animate(withDuration: 0.2) {
            self.locationInputView.alpha = 0
            self.locationViewText.alpha = 1
            
        } completion: { _ in
            self.view.subviews.first(where: { $0 is LocationInputView } )?.removeFromSuperview()
        }
    }
}

extension HomeMapViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.textColor = .black
        
        cell.backgroundColor = .white
        return cell
    }
}
