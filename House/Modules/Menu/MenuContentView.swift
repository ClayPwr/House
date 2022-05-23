//
//  MenuContentView.swift
//  House
//
//  Created by User on 5/8/22.
//

import UIKit
import SnapKit

public final class MenuContentView: UIView {
    
    var tableView = UITableView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.registerCell(MenuCell.self)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
}

// MARK: - Constraints

extension MenuContentView {
    
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }
}
