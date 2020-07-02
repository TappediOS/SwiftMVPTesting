//
//  ViewBuilder.swift
//  SwiftUITesting
//
//  Created by jun on 2020/06/23.
//  Copyright © 2020 jun. All rights reserved.
//
import UIKit

struct ViewBuilder {
    static func create() -> UIViewController {
        guard let viewController = MainsViewController.loadFromStoryboard() as? MainsViewController else {
            fatalError("fatal: Failed to initialize the SampleViewController")
        }
        let model = ViewModel()
        let presenter = ViewPresenter(model: model)
        viewController.inject(with: presenter)
        return viewController
    }
}

public extension UIViewController {
    class func loadFromStoryboard<T>() -> T where T: UIViewController {
        let storyboard = UIStoryboard(name: NSStringFromClass(self).components(separatedBy: ".").last!.removeAt(text: "ViewController")!, bundle: nil)
        return storyboard.instantiateInitialViewController() as! T
    }
}

extension String {
    func removeAt(text: String) -> String? {
        if let range = self.range(of: text) {
            return self.replacingCharacters(in: range, with: "")
        }
        return nil
    }
}
