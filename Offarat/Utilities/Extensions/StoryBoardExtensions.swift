//
//  StoryBoardExtensions.swift
//  PathaoUser
//
//  Created by Muzahidul Islam on 10/1/17.
//  Copyright © 2017 Pathao Inc. All rights reserved.
//

import Foundation
import UIKit


protocol StoryboardIdentifier {
    static var sbIdentifier: String {get}
}

extension StoryboardIdentifier where Self: UITableViewCell {
    static var sbIdentifier: String{
        return String.init(describing: self)
    }
}

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: StoryboardIdentifiable{
    
}
extension UIStoryboard {
    
    enum StoryBoard: String {
        case Auth
        case Main
        
        var fileName: String {
            return rawValue
        }
    }
    
    static func storyBoard(storyBoard: StoryBoard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyBoard.fileName, bundle: bundle)
    }
    
    
    func instantiateViewController<T: UIViewController>(_: T.Type) -> T where T: StoryboardIdentifiable {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
    
    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }

}

