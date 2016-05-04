//
//  FlowDelegate.swift
//  GitClieHub
//
//  Created by don Onwunum on 03/05/2016.
//  Copyright © 2016 pigstycoders. All rights reserved.
//

import UIKit

protocol FlowDelegate: class {
    
    
    func start(window: UIWindow!)
    func goHome()
    
    // Usage:
    // 1. Define a protocol here:
    //      func goToRepo(withId Id: String)
    
    // 2. Implement protocol in FlowNavigationController
    //      repo = repoViewController()
    //      repo.flowDelegate = self
    //      repoNavController = UINavigationController(rootViewController: repo)
    
    // 3. Within the Presenter, you can now navigate to particular screen
    //      self.flowDelegate.goToRepo(withId: id)
   
}