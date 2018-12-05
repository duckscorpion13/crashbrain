//
//  MenuVC.swift
//  RaceCalculator
//
//  Created by DerekYang on 06/11/2018.
//  Copyright © 2018 DerekYang All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
      if let navi = self.navigationController {
        navi.setNavigationBarHidden(true, animated: animated)
        navi.interactivePopGestureRecognizer?.isEnabled = false
      }
      super.viewWillAppear(animated)
//       self.preferredStatusBarStyle = .lightContent
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        
    }

}

