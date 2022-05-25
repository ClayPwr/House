//
//  DetailViewController.swift
//  House
//
//  Created by User on 5/15/22.
//

import UIKit

public final class DetailViewController: ViewController, ContentControllerProtocol {
    
    private let furniture: Furniture
    
    public init(furniture: Furniture) {
        self.furniture = furniture
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public typealias ContentView = DetailContentView
    
    public override func loadView() {
        view = ContentView()
    }
 
    public override func viewDidLoad() {
        super.viewDidLoad()
        contentView.update(viewModel: furniture)
        contentView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

// MARK: - DetailContentViewDelegate

extension DetailViewController: DetailContentViewDelegate {
    func handleOrder(in view: DetailContentView) {
        let vc = OrderViewController(furniture: furniture)
        present(vc, animated: true)
    }
}
