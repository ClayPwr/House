//
//  CollectionView & TableView.swift
//  House
//
//  Created by User on 5/8/22.
//

import UIKit

extension UICollectionView {

    public func registerCell(_ type: UICollectionViewCell.Type) {
        register(type.self, forCellWithReuseIdentifier: type.reuseID)
    }

    public func registerNib(_ type: UICollectionViewCell.Type) {
        let nib = UINib(nibName: type.reuseID, bundle: nil)
        register(nib, forCellWithReuseIdentifier: type.reuseID)
    }

    public func registerSupplementaryView(
        ofKind kind: String,
        _ type: UICollectionReusableView.Type
    ) {
        register(type.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.reuseID)
    }

    public func dequeueCell<T>(
        for indexPath: IndexPath,
        cellType: T.Type = T.self
    ) -> T where T: UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as? T else {
            fatalError("Failed to dequeue cell with ID \(cellType.reuseID) for \(indexPath)")
        }
        return cell
    }

    public func dequeueSupplementaryView<T>(
        ofKind kind: String,
        for indexPath: IndexPath,
        supplementaryType: T.Type = T.self
    ) -> T where T: UICollectionReusableView {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: supplementaryType.reuseID, for: indexPath) as? T else {
            fatalError("Failed to dequeue cell with ID \(supplementaryType.reuseID) for \(indexPath)")
        }
        return view
    }

}

extension UITableView {

    public func registerCell(_ type: UITableViewCell.Type) {
        register(type.self, forCellReuseIdentifier: type.reuseID)
    }

    public func registerNib(_ type: UITableViewCell.Type) {
        let nib = UINib(nibName: type.reuseID, bundle: nil)
        register(nib, forCellReuseIdentifier: type.reuseID)
    }

    public func registerHeaderFooterView(_ type: UITableViewHeaderFooterView.Type) {
        register(type.self, forHeaderFooterViewReuseIdentifier: type.reuseID)
    }

    public func dequeueCell<T>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseID, for: indexPath) as? T else {
            fatalError("Failed to dequeue cell with ID \(cellType.reuseID) for \(indexPath)")
        }
        return cell
    }

    public func dequeueHeaderFooterView<T>(type: T.Type = T.self) -> T where T: UITableViewHeaderFooterView {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: type.reuseID) as? T else {
            fatalError("Failed to dequeue cell with ID \(type.reuseID)")
        }
        return view
    }

}
