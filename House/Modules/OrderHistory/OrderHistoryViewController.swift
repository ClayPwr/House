//
//  OrderHistoryViewController.swift
//  House
//
//  Created by User on 4/3/22.
//

import UIKit

public final class OrderHistoryViewController: ViewController, ContentControllerProtocol {
    
    private var furnitures: [Furniture] {
        MockFurniture.shared.orderedFurnitures()
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public typealias ContentView = OrderHistoryContentView
    
    public override func loadView() {
        super.loadView()
        view = ContentView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
    
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension OrderHistoryViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        furnitures.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OrderedMenuCell = tableView.dequeueCell(for: indexPath)
        cell.update(viewModel: furnitures[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension OrderHistoryViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
