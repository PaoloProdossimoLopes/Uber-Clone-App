//
//  LocationInputViewController.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 11/11/21.
//

import UIKit

final class LocationInputViewController: UIViewController {
    
    //MARK: - Properties:
    private let header: InputLocationViewHeader = .init()
    private let viewWithSqaresViews: SquaresViews = .init()
    
    //MARK: - Init
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        configureViewHierarchy()
        configurConstrantis()
        
        header.delegate = self
    }
    
    private func configureViewHierarchy() {
        [header].forEach { view.addSubview($0) }
    }
    
    private func configurConstrantis() {
        header.configureContstaints(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
    }
    
    //MARK: - API
    
    //MARK: - Selectors
    
    @objc internal func closeButtonHandleTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension LocationInputViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .black
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

extension LocationInputViewController: InputLocationViewHeaderDelegate {
    
    
    
}
