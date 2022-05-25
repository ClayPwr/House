//
//  OrderViewController.swift
//  House
//
//  Created by User on 5/23/22.
//

import UIKit
import StoreKit

public final class OrderViewController: ViewController, ContentControllerProtocol {
    
    public typealias ContentView = OrderContentView
    
    private var furniture: Furniture
    
    init(furniture: Furniture) {
        self.furniture = furniture
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        super.loadView()
        view = ContentView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        contentView.update(viewModel: furniture)
        contentView.delegate = self
    }
    
    
}

// MARK: - OrderContentViewDelegate

extension OrderViewController: OrderContentViewDelegate {
    func handleDismiss(in view: OrderContentView) {
        dismiss(animated: true)
    }
    
    func handleFullApp(in view: OrderContentView) {
        guard let scene = contentView.window?.windowScene else { return }
        let config = SKOverlay.AppClipConfiguration(position: .bottom)
        let overlay = SKOverlay(configuration: config)
        overlay.present(in: scene)
    }
}
