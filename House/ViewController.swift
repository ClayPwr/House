//
//  ViewController.swift
//  House
//
//  Created by User on 1/23/22.
//

import UIKit

class ViewController: UIViewController, Stroyboarded {
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }

    @IBAction func openProfileAction(_ sender: UIButton) {
        coordinator?.openProfile()
    }
    
}

