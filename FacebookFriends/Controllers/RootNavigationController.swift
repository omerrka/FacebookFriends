//
//  RootNavigationController.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 5.05.2023.
//

import UIKit

final class RootNavigationController: UINavigationController {
    
    let appearance = UINavigationBarAppearance()
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearance.configureWithOpaqueBackground()
        
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.standardAppearance = appearance
    }
}

