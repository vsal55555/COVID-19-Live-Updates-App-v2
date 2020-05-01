//
//  firstViewController.swift
//  Project_1_shree_Covid-19-demo
//
//  Created by BSAL-MAC on 4/16/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class firstViewController: UIViewController, CovidServiceDelegate {

    let covidService = CovidService()
    var data = [[String: AnyObject]]()
    
    @IBOutlet weak var total_cases_label: UILabel!
    @IBOutlet weak var total_deaths_label: UILabel!
    @IBOutlet weak var total_cases_np: UILabel!
    @IBOutlet weak var tested_positive_label_np: UILabel!
    @IBOutlet weak var total_recovered_label_np: UILabel!
    //@IBOutlet weak var total_deaths_np_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.covidService.delegate = self as? CovidServiceDelegate
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.getInterdata()
        print("I'm in first VC")
        self.covidService.getdata()
    }
    func setdata(usermodel: UserModel) {
        self.tested_positive_label_np.text = "\(usermodel.tested_positive)"
        self.total_cases_np.text = "\(usermodel.tested_total)"
        //self.total_deaths_np_label.text = "\(usermodel.totalDeaths_np)"
        self.total_recovered_label_np.text = "\(usermodel.recovered)"
        print("\(usermodel.recovered)")
        
        print("the number of positive cases \(usermodel.tested_positive)")
    }
    func getInterdata() {
        
        DispatchQueue.main.async {
            let url = URL(string: "https://nepalcorona.info/api/v1/data/world")
            Alamofire.request(url!, method: .get, parameters: nil, headers: nil).responseJSON { (response) in
                switch response.result{
                case .success(let value):
                    //let json = JSON(value)
                    let resultArray = value as! [AnyObject]
                    let resultDic = resultArray[0] as! [String: AnyObject]
                    let totalCases = resultDic["totalCases"] as! Int
                    let totalDeaths = resultDic["totalDeaths"] as! Int
                    
                    //print(json["totalCases"].intValue)
                    //print(json["totalDeaths"].intValue)
                    //self.data = da as! [[String: AnyObject]]
                    self.total_cases_label.text = "\(totalCases)"
                    self.total_deaths_label.text = "\(totalDeaths)"
                    //self.total_deaths_label.text = "\(json["totalDeaths"].intValue)"
                    
                    
                
                    
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
            
        }
    }

}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


