//
//  Stroyboarded.swift
//  House
//
//  Created by User on 1/23/22.
//

import Foundation
import UIKit

protocol Stroyboarded {
    static func instantiate() -> Self
}

extension Stroyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
