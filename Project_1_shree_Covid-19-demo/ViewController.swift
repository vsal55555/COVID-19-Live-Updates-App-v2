//
//  ViewController.swift
//  Project_1_shree_Covid-19-demo
//
//  Created by BSAL-MAC on 4/13/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var name = ["Where to call for help","About COVID-19","Prevention","If you  get sick","Travel Advice"]

    @IBOutlet weak var QAtableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
            vc?.image = UIImage(named: name[indexPath.row])!
            vc?.name = name[indexPath.row]
    }
}


