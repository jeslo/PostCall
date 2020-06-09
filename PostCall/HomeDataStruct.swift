//
//  HomeDataStruct.swift
//  PostCall
//
//  Created by Joe on 09/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import Foundation
struct HomeDataStruct: Codable {
    var status: Bool
    var data: data
    }
struct data: Codable{
    var name: String
    var salary: String
    var age: String
    var id: Int
}
