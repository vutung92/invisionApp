//
//  IATapIDVC.swift
//  InvisionApp
//
//  Created by Tung Vu on 6/17/18.
//  Copyright © 2018 Tung Vu. All rights reserved.
//

import UIKit

class IATapIDVC: UIViewController {

    @IBOutlet weak var viewTapID: UIView!{
        didSet {
            viewTapID.layer.cornerRadius = 5
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
