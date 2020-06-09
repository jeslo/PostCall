//
//  NetworkHandler.swift
//  PostCall
//
//  Created by Joe on 09/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import Foundation
enum PostType {
    case postSample
}
protocol NetworkHandlerDeligate {
    func hitApi(dataGet: Any)
}
class NetworkHandler
{
var networkDeligate: NetworkHandlerDeligate!
    func getApi(url: String, dataStruct: PostType)
{
    //print("jkkjkjkjkjkjkjkj", url)
    let configuration = URLSessionConfiguration.default
    let session = URLSession(configuration: configuration)
    let apiurl = URL(string: url)
    var request: URLRequest = URLRequest(url: apiurl!)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    
    let postDataGet = session.dataTask(with: apiurl!) { data, response, error in
        guard let httpresponse = response as? HTTPURLResponse, let received = data
            else{
                print("error: not a valid http response")
                return
                }
            switch (httpresponse.statusCode)
            {
            case 200: print("success")
                break
            case 400: print("failed")
                break
            default:
                print("failed")
                break
        }
    }
    postDataGet.resume()
}
}
