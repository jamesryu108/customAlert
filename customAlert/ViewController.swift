//
//  ViewController.swift
//  customAlert
//
//  Created by James Ryu on 2020-08-11.
//  Copyright © 2020 James Ryu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sampleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set up button constraints
        
        view.addSubview(sampleButton)
        
        NSLayoutConstraint.activate([
            sampleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sampleButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sampleButton.widthAnchor.constraint(equalToConstant: 250),
            sampleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        sampleButton.backgroundColor = .systemBlue
        
        sampleButton.layer.cornerRadius = 20
        
        sampleButton.setTitle("Reveal the custom alert", for: .normal)
        
        // Set action
        
        sampleButton.addTarget(self, action: #selector(openAlert), for: .touchUpInside)
    }
    
    @objc func openAlert() {
        presentWeatherman(title: "Error de proceso", message: "Intenta de neuvo", buttonTitle: "Cerrar")
    }
    
    func presentWeatherman(title: String, message: String, buttonTitle: String) {
        
        let alertVC = SampleAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
        
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        
        self.present(alertVC, animated: true, completion: nil)
    }
}
