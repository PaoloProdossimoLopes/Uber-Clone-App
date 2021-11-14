//
//  LocationInpuActivationView.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 11/11/21.
//

import UIKit

protocol LocationInpuActivationViewDelegate: AnyObject {
    func LocationInputLocationViewTapped()
}

final class LocationInpuActivationView: UIView {
    
    //MARK: - Properties:
    
    weak var delegate: LocationInpuActivationViewDelegate?
    
    private lazy var indicatorView: UIView = {
        let view = UIView()
        
        let secondView = UIView()
        secondView.backgroundColor = .black
        view.addSubview(secondView)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        secondView.heightAnchor.constraint(equalToConstant: 6).isActive = true
        secondView.widthAnchor.constraint(equalToConstant: 6).isActive = true
        
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Where to?"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var containerView = UIView()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        
        self.alpha = 0
        backgroundColor = .white
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(startToLookingFor))
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
        
        configureViewHierarchy()
        configureConstraints()
    }
    
    private func configureViewHierarchy() {
        [indicatorView, placeholderLabel].forEach { containerView.addSubview($0) }
        addSubview(containerView)
    }
    
    private func configureConstraints() {
        containerView.configureContstaints(top: topAnchor, leading: leadingAnchor,
                                           trailing: trailingAnchor, bottom: bottomAnchor)
        indicatorView.configureContstaints(leading: containerView.leadingAnchor,
                                           centerY: containerView.centerYAnchor,
                                           paddingLeading: 30, height: 6, width: 6)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -80).isActive = true
        placeholderLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    ///Essa função é responsavel por exibir animadamente a box, pq ela vem com alph = 0
    func animateIntro() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1
        }
    }
    
    //MARK: - Selectors
    
    @objc private func startToLookingFor() {
        delegate?.LocationInputLocationViewTapped()
    }
    
}
