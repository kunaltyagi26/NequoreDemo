//
//  DataService.swift
//  Nequore
//
//  Created by Kunal Tyagi on 09/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    static let instance = DataService()
    
    fileprivate let queueLabel = "com.kunaltyagi.Nequore"
    fileprivate let baseUrl = "http://45.232.252.136/api/"
    
    func getData(completionHandler: @escaping ((_ isResponse: Bool,_ data: Data) -> Void)) {
        let queue = DispatchQueue(label: queueLabel, qos: .userInitiated, attributes: [.concurrent])
        var res = false
        var propertyData: API_JSON?
        let url = baseUrl + "user/home"
        Alamofire.request(url, method: .post,encoding : JSONEncoding.default ,headers : .none)
            .response(
                queue: queue,
                responseSerializer: DataRequest.jsonResponseSerializer(),
                completionHandler: { response in
                    if((response.result.value) != nil) {
                        let data = JSON(response.result.value!)
                        res = true
                        propertyData = API_JSON(json: data)
                    }
                    
                    DispatchQueue.main.async {
                        completionHandler(res,(propertyData?.data)!)
                    }
            }
        )
        
    }
}
