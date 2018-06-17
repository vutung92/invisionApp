//
//  IALoginVC.swift
//  InvisionApp
//
//  Created by Tung Vu on 6/17/18.
//  Copyright © 2018 Tung Vu. All rights reserved.
//

import UIKit

class IALoginVC: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!{
        didSet {
            //txtUserName.layer.cornerRadius =  5
            //txtUserName.layer.borderColor = UIColor.black.cgColor
            //txtUserName.layer.borderWidth = 1
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
            txtUserName.leftView = leftView
            txtUserName.leftViewMode = .always
        }
    }
    
    @IBOutlet weak var txtPassword: UITextField!{
        didSet {
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
            txtPassword.isSecureTextEntry = true
            txtPassword.leftView = leftView
            txtPassword.leftViewMode = .always
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func actionSignIn(_ sender: Any) {
        let vc = IATapIDVC(nibName: IATapIDVC.typeName, bundle: Bundle.main)
        self.present(vc, animated: true, completion: nil)
        
    }
    
}
