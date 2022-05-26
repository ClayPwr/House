//
//  MenuViewController.swift
//  House
//
//  Created by User on 4/3/22.
//

import UIKit

public final class MenuViewController: ViewController, ContentControllerProtocol {
    
    private var furnitures: [Furniture] = [] {
        didSet {
            contentView.tableView.reloadData()
        }
    }
    
    public typealias ContentView = MenuContentView
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = ContentView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        Task {
            furnitures = try await MockFurniture.shared.getFurnitures()
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
}

// MARK: - UITableViewDataSource

extension MenuViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        furnitures.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuCell = tableView.dequeueCell(for: indexPath)
        cell.update(viewModel: furnitures[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate

extension MenuViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController(furniture: getItem(indexPath: indexPath))
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func getItem(indexPath: IndexPath) -> Furniture {
        return furnitures[indexPath.row]
    }
}

// MARK: - MenuCellDelegate

extension MenuViewController: MenuCellDelegate {
    func handleOrder(in view: MenuCell) {
        let vc = OrderViewController(furniture: getItemBy(cell: view) ?? furnitures[0])
        present(vc, animated: true)
    }
    
    private func getItemBy(cell: MenuCell) -> Furniture? {
        guard let indexPath = contentView.tableView.indexPath(for: cell) else {
            return nil
        }
        return getItem(indexPath: indexPath)
    }
}
