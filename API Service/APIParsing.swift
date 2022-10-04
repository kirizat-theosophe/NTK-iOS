//
//  APIParsing.swift
//  NTK
//
//  Created by Torgeir Eikeland on 16/03/2022.
//

import SwiftUI
import Alamofire

class APIParsing {
   
    let url = "https://www.nasjonaltjenestekatalog.no/ntk-proxy/tjenestebeskrivelse/search?sprak=no"
    
    let headers: HTTPHeaders = [
        "accessKey": "Fs8a9Az7arFnakgKpHxa4"
    ]
    
    func apiStuff(callback: @escaping ([Tjenestebeskrivelse]?) -> Void){
        AF.request(url, headers: headers).responseJSON { response in
            if response.error == nil {
                print("Success")
                if let safeData = response.data {
                    do {
                        let results = try JSONDecoder().decode([Tjenestebeskrivelse].self, from: safeData)
                        callback(results)
                        print("API PARSED")
                        return
                    } catch {
                        print(error)
                    }
                }
            } else {
                print(response.error as Any)
                print("error")
            }
            
            callback(nil)
            
        }
    }
}
