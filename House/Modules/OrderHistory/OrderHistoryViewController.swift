//
//  OrderHistoryViewController.swift
//  House
//
//  Created by User on 4/3/22.
//

import UIKit

public final class OrderHistoryViewController: ViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
    }
}
