//
//  ViewController.swift
//  Project_1_shree_Covid-19-demo
//
//  Created by BSAL-MAC on 4/13/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
var name = ["Where to call for help","About COVID-19","Prevention","Symptoms","Travel Advice"]

var itemDetails = ["Help-Line Number(Kathmandu Area) \n1.Dr. Shravan Kumar Misra \n2. Dr. Ranjit Shah\n3. Shri Rajesh Kumar Gupta \n4. Dinesh Thapa Magar (For Night Time)\n5. Naresh Thapa Magar  (for night time)\n","A novel corona virus is a new corona virus that has not been previously identified. The virus causing corona virus disease 2019 (COVID-19), is not the same as the corona viruses that commonly circulate among humans and cause mild illness, like the common cold. In late December, 2019, patients presenting with viral pneumonia due to an unidentified microbial agent were reported in Wuhan, China. A novel corona virus was subsequently identified as the causative pathogen, provisionally named 2019 novel coronavirus (2019-nCoV).  World Health Organization (WHO) commonly named as Covid-19.\nOn Jan 26, 2020, more than 2000 cases of 2019-nCoV infection have been confirmed, most of which involved people living in or visiting Wuhan, and human-to-human transmission has been confirmed. Coronaviruses have been identified in several avian hosts,2,3 as well as in various mammals, including camels, bats, masked palm civets, mice, dogs, and cats. Novel mammalian coronaviruses are now regularly identified.\nA diagnosis with corona virus 229E, NL63, OC43, or HKU1 is not the same as a COVID-19 diagnosis. Patients with COVID-19 will be evaluated and cared for differently than patients with common corona virus diagnosis.","1. Standard recommendation to prevent infection spread include regular hand washing often for 20 seconds and encourage others to do so. \n2. If no soap and water available, use hand sanitizer. \n3. Cover coughs and sneezes with a tissue, then throw the tissue away. \n4. Avoid touching your eyes, nose, and mouth with unwashed hands. \n5. Disinfect surfaces, buttons, handles, knobs and other places touched often. \n6. Avoid close contact with people who are sick","Common signs of infection include :\n1.Fever\n2. After 2 to 7 days develop a dry cough\n3. Mild breathing difficulties at the outset\n4. Gastrointestinal Issues \n5. Diarrhea\n6. General body aches\n         In severe cases, High fever which rises from 100.4 ํF or higher,  Pneumonia , severe acute respiratory syndrome(SARS), kidney failure in severe cases lead to death of the patient.\n", "\n1. Wash hand with soap/ use hand sanitizer. \n2. Avoid direct contact with sick people. \n3. Drink water. \n4. Avoid direct contact with animals. \n5. Proper vaccination & travel insurance. \n6 Eat properly cooked meat/eggs"  ]

    @IBOutlet weak var QAtableView: UITableView!
    let firstVC = firstViewController()
    var userData = [UserModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        }
        // Do any additional setup after loading the view, typically from a nib.
    override func viewWillAppear(_ animated: Bool) {
        print("i'm in default VC")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    //needed 2 methods to conform tableview controller delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? cellTableViewCell
//cast this cell to tableviewcell so xcode knows
        //now we've to pass array data to this new cell
        cell?.cellLbl.text = name[indexPath.row]
        cell?.cellImg.image = UIImage(named: name[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as? detailViewController
        self.navigationController?.pushViewController(vc!, animated: true)
            //vc?.image = UIImage(named: name[indexPath.row])!
            vc?.name = itemDetails[indexPath.row]
            
    }
}


