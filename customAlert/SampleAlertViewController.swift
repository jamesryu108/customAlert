//
//  CustomAlert.swift
//  customAlert
//
//  Created by James Ryu on 2020-08-11.
//  Copyright © 2020 James Ryu. All rights reserved.
//

import UIKit

class SampleAlertViewController: UIViewController {

    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let container: UIView = {
        
    let container = UIView()
        container.backgroundColor = .systemBackground
        container.layer.cornerRadius = 16
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.clear.cgColor
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    let subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let closeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return btn
    }()
    
    let alertImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
        
    init(title: String, message: String, buttonTitle: String) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
        
        titleLabel.text = self.alertTitle
        subtitleLabel.text = self.message
        closeButton.setTitle(self.buttonTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        setupContainerViews()
        setupLabels()
        setupButton()
    }
    
    func setupContainerViews() {
        
        // Set up container
        
        view.addSubview(container)
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalToConstant: view.frame.width * 0.75),
            container.heightAnchor.constraint(equalToConstant: view.frame.height * 0.2)
        ])
        
        // Set up image
        
        container.addSubview(alertImage)

        NSLayoutConstraint.activate([
            alertImage.topAnchor.constraint(equalTo: container.topAnchor, constant: -32),
            alertImage.widthAnchor.constraint(equalToConstant: 64),
            alertImage.heightAnchor.constraint(equalToConstant: 64),
            alertImage.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
        
        alertImage.image = UIImage(named: "xImage")
        
    }
    
    func setupLabels() {
        
        container.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: alertImage.bottomAnchor, constant: 30),
                titleLabel.widthAnchor.constraint(equalToConstant: 200),
                titleLabel.heightAnchor.constraint(equalToConstant: 25),
                titleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
        
        container.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                subtitleLabel.widthAnchor.constraint(equalToConstant: 200),
                subtitleLabel.heightAnchor.constraint(equalToConstant: 25),
                subtitleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
    }
    
    func setupButton() {
        container.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
                closeButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0),
                closeButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
                closeButton.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 0),
                closeButton.rightAnchor.constraint(equalTo: container.rightAnchor, constant: 0)
        ])
        
        closeButton.layer.cornerRadius = 12.5
        
        closeButton.layer.borderColor = UIColor.systemGray6.cgColor
        closeButton.layer.borderWidth = 1
        
        closeButton.addTarget(self, action: #selector(setupButtonAction), for: .touchUpInside)
    }
    
    @objc func setupButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
