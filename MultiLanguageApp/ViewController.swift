//
//  ViewController.swift
//  MultiLanguageApp
//
//  Created by Ferhan Akkan on 4.04.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit
import Localize

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view created")
    }


    @IBAction func engButtonPressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        Localize.update(language: "en")
        userDefaults.set("en", forKey: "lang")
        userDefaults.synchronize()
        
        self.view.window?.rootViewController = UIStoryboard.main.instantiateInitialViewController()
    
        
    }
    
    @IBAction func trButtonPressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        Localize.update(language: "tr")
        userDefaults.set("tr", forKey: "lang")
        userDefaults.synchronize()
        
        self.view.window?.rootViewController = UIStoryboard.main.instantiateInitialViewController()
    }
}


public extension UIStoryboard {
    
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: .main)
    }
}

