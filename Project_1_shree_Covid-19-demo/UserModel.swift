//
//  UserModel.swift
//  Project_1_shree_Covid-19-demo
//
//  Created by BSAL-MAC on 4/15/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import Foundation
import SwiftyJSON

struct UserModel {
    let tested_total: Int
    let tested_positive:Int
    let totalDeaths_np: Int
    let recovered: Int
    
    init(tested_total_num: Int, tested_positive_np: Int, death_num: Int, recovered_num: Int) {
        self.tested_total = tested_total_num
        self.tested_positive = tested_positive_np
        self.totalDeaths_np = death_num
        self.recovered = recovered_num
    }
}
