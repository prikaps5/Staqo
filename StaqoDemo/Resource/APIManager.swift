//
//  APIManager.swift
//  StaqoDemo
//
//  Created by Priyanka Kapasiya on 07/12/20.
//  
//

import Foundation


typealias FailureClosure  = ((String)-> Void)?
typealias ResponseClosure = ((Dictionary<String,Any>)-> Void)?
typealias JSONDict        = [String : Any]

struct ApiUrl {
    static let reqUrl = "https://reqres.in/api/users?page="
}


enum MethodType : String {
    case GET
    case POST
}

class ApiManager {
    
    static let shared  = ApiManager()
    
    func callApi( _ baseUrl : String ,methodType : MethodType , params : Dictionary<String,Any> , successClosure : ResponseClosure , failureClosures : FailureClosure) {
        if Reachability.isConnectedToNetwork(){
        var request = URLRequest(url: URL(string: baseUrl)!)
        request.httpMethod = methodType.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
          
            do {
                if let data = data {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    successClosure?(json)
                   }
                }
                
            } catch {
                failureClosures?(error.localizedDescription)
            }
        })
        
        task.resume()
    } else{
        failureClosures?("Internet Connection not Available!")

    }
    }
    
}

