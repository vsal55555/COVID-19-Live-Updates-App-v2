//
//  CovidService.swift
//  Project_1_shree_Covid-19-demo
//
//  Created by BSAL-MAC on 4/20/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol CovidServiceDelegate {
    func setdata(usermodel: UserModel)
}

class CovidService: UIViewController {
    
    var delegate: CovidServiceDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //request data
    //wait
    //process and return whoever need it
    
    func getdata(){
        DispatchQueue.main.async {
            let url = URL(string: "https://nepalcorona.info/api/v1/data/nepal")
            Alamofire.request(url!, method: .get, parameters: nil, headers: nil).responseJSON { (response) in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    //let myjson = json
                    let tested_total = json["tested_total"].intValue
                    let positive_num = json["tested_positive"].intValue
                    let death_num = json["deaths"].intValue
                    let recov_num = json["recovered"].intValue
                    
                   // let total_cases = json["totalCases"].intValue
                   //let total_deaths = json["totalDeaths"].intValue
                    
                    let userModel = UserModel(tested_total_num: tested_total, tested_positive_np: positive_num, death_num: death_num, recovered_num: recov_num)
                    if self.delegate != nil{
                        self.delegate?.setdata(usermodel: userModel)
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
            
        }
    }
    
}
