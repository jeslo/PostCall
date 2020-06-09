//
//  SampleDataStruct.swift
//  PostCall
//
//  Created by Joe on 09/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import Foundation
struct SampleDataStruct: Codable {
    var data: [details]
}
struct details: Codable {
    var completed: Bool
    var userId: Int
    var id: Int
    var title: String
    
}
