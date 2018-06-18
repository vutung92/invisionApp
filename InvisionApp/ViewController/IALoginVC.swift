//
//  IALoginVC.swift
//  InvisionApp
//
//  Created by Tung Vu on 6/17/18.
//  Copyright © 2018 Tung Vu. All rights reserved.
//

import UIKit

class IALoginVC: UIViewController {

    var userdata: IAUserData?
    
    @IBOutlet weak var txtUserName: UITextField!{
        didSet {
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
    
    func signIn(username: String?, password: String?, completion: @escaping (IAUser?) -> Void){
        let params: [String: Any] = [
            IAApiKey.username: username ?? "",
            IAApiKey.password: password ?? ""
        ]
        IAApiManager.sharedInstance.postSignIn(params: params) { (data) in
            completion(data)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func actionSignIn(_ sender: Any) {
        self.signIn(username: txtUserName.text, password: txtPassword.text, completion: { (data) in
            if data != nil {
                let vc = IATapIDVC(nibName: IATapIDVC.typeName, bundle: Bundle.main)
                vc.userdata = data?.user
                self.present(vc, animated: true, completion: nil)
            }else {
                print("error")
            }
        })
    }
    
}
