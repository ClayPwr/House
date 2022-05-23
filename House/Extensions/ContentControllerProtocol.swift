//
//  ContentControllerProtocol.swift
//  House
//
//  Created by User on 5/8/22.
//
import UIKit

/// Protocols that provides `contentView` properties, casted to the specified type.
/// Designed to be used with `UIViewController` subclasses only by providing concrete `UIView` subclass type.
/// Strongly not recommended to implement `contentView` property in classes, that adopts this protocol.
public protocol ContentControllerProtocol: AnyObject {

    /// Specific type of view.
    associatedtype ContentView: UIView

}

public extension ContentControllerProtocol where Self: UIViewController {

    /// Property, that incapsulates casting base view to the specific type.
    /// - important: Do not implement this property in your classes,
    /// it already has default implementation and designed to be used as it is.
    /// If you need some custom behaviour, do not use this protocol at all.
    var contentView: ContentView {
        guard let contentView = view as? ContentView else {
            fatalError("Screen initialized with wrong view class!")
        }
        return contentView
    }

}
