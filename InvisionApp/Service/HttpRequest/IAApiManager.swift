//
//  TDApiManager.swift
//  InvisionApp
//
//  Created by Tung Vu on 6/17/18.
//  Copyright © 2018 Tung Vu. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper

class IAApiManager {
    static var sharedInstance: IAApiManager = IAApiManager()
    var Host: String = Bundle.main.object(forInfoDictionaryKey: "ApiHost") as! String
    var token: String = UserDefaults.standard.getToken()
    var hasPostHidePlaceHolder: Bool = false
    
    func createFormUrlEncoded() -> HTTPHeaders {
        return [
            "Content-Type":"application/x-www-form-urlencoded",
            "token": token
        ]
    }
    
    func createFormMultiPart() -> HTTPHeaders {
        return [
            "Content-Type":"multipart/form-data",
            "token": token
        ]
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
 

    
    func post(path: String, params: [String: Any], completion: @escaping (Error?,Data?) -> Void) {
        let url = path
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: createFormUrlEncoded())
            .response { response in
                completion(response.error,response.data)
        }
    }
    
    func postSignIn(params: [String: Any], completion: @escaping (IAUser?) -> Void) {
        post(path: IAApiKey.POST_SIGN_IN, params: params) { (error,data) in
            if error != nil {
                completion(nil)
            } else {
                let stringJson = String(data: data!, encoding: .utf8)
                completion(Mapper<IAUser>().map(JSONString: stringJson!))
            }
        }
    }
    
    
}
