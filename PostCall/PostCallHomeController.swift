//
//  PostCallHomeController.swift
//  PostCall
//
//  Created by Joe on 09/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit
let jsonUrl = "https://reqres.in/api/register"
class PostCallHomeController: UIViewController,NetworkHandlerDeligate {
    var list : Datum!
   
    

    @IBOutlet weak var homeID: UILabel!
    @IBOutlet weak var idValue: UILabel!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var nameValue: UILabel!
    @IBOutlet weak var salary: UILabel!
    @IBOutlet weak var salaryValue: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var ageValue: UILabel!
    
    let netWorkCall = NetworkHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.netWorkCall.networkDeligate = self
        self.netWorkCall.getApi(url: jsonUrl, dataStruct: PostType.postSample)
        
        
    }
    
    func hitApi(dataGet: Any) {
        let dd = dataGet as! HomeDataStruct
        for (, age) in ages 
        print("ID", dd.data[5].id, "Name" ,dd.data[5].name)
    }
    

}
