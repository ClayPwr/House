//
//  OrderHistoryContentView.swift
//  House
//
//  Created by User on 5/24/22.
//

import UIKit
import Combine

public final class OrderHistoryContentView: UIView {
    
    var tableView = UITableView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.registerCell(OrderedMenuCell.self)
    }
    
    public override func layoutSubviews() {
        setupConstraints()
    }
    
}

// MARK: - Constraints & Subview

extension OrderHistoryContentView {
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }
}
