//
//  detailViewController.swift
//  Project_1_shree_Covid-19-demo
//
//  Created by BSAL-MAC on 4/13/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailImg: UIImageView!
    
    //that holds data sent from the previous vc
    var image = UIImage()
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = "you pressed \(name)"
        detailImg.image = image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
