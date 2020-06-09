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
    request.addValue("userId", forHTTPHeaderField: "1")
    request.addValue("id", forHTTPHeaderField: "1")
    
    
    let postDataGet = session.dataTask(with: apiurl!) { data, response, error in
        guard let httpresponse = response as? HTTPURLResponse, let received = data
            else{
                print("error: not a valid http response")
                return
                }
            switch (httpresponse.statusCode)
            {
            case 200: print("success")
            print(">>>>>>>>>", received)
                switch dataStruct
                {
                case PostType.postSample:
                    do
                    {
                    let parsedData = try JSONDecoder().decode(SampleDataStruct.self, from: received)
                        print("Decoded Data", parsedData.data)
                        self.networkDeligate.hitApi(dataGet: parsedData)
                    }
                    catch {
                        print("Decoding Failed")
                    }
                    break
                    
                    
                }
            
                break
            case 400: print("moonji")
                break
            default:
                print("fucked failed")
                break
        }
    }
    postDataGet.resume()
}
}
