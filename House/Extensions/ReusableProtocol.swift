//
//  ReusableProtocol.swift
//  House
//
//  Created by User on 5/8/22.
//

import UIKit

public protocol ReusableViewProtocol: AnyObject {
    static var reuseID: String { get }
}

extension ReusableViewProtocol {

    public static var reuseID: String {
        String(describing: self)
    }

}

extension UICollectionReusableView: ReusableViewProtocol {
}

extension UITableViewCell: ReusableViewProtocol {
}

extension UITableViewHeaderFooterView: ReusableViewProtocol {
}
