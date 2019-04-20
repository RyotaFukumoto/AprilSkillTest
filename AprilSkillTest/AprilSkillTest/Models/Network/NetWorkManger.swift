//
//  NetWorkManger.swift
//  AprilSkillTest
//
//  Created by ryota on 2019/04/20.
//  Copyright © 2019 ryota. All rights reserved.
//

import UIKit
import Alamofire

class NetWorkManger: NSObject {
    class func restaurantGenreGetAPI() {
        let url = "http://webservice.recruit.co.jp/hotpepper/genre/v1/"
        if let path = Bundle.main.path(forResource: "APIKey", ofType: "plist") {
            if let apiDic = NSDictionary(contentsOfFile: path) as? [String:Any] {
                if let key = apiDic["GenreKey"] as? String {
                    let parameters : Parameters = ["key":key];
                    Alamofire.request(url , method: .get, parameters: parameters)
                        .responseJSON{ response in
                            //上手く取れている場合Realmに入れる
                            print(response.result as Any)
                                
                            
                            
                            
                    }
                    
                }
            }
        }
    }
}
