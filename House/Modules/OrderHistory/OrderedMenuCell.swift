//
//  OrderedMenuCell.swift
//  House
//
//  Created by User on 5/24/22.
//

import UIKit

public class OrderedMenuCell: MenuCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupOrderHistory()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
