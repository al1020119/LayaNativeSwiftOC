//
//  ViewController.swift
//  SwiftLayaNative
//
//  Created by iCocos on 2019/5/9.
//  Copyright © 2019 com.fiction.jmt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let layaBridge = LayaBridgeViewController()
        self.view.addSubview(layaBridge.view)
        self.addChild(layaBridge)
    }

}

