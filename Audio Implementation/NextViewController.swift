//
//  NextViewController.swift
//  Audio Implementation
//
//  Created by Leads Computer on 12/4/19.
//  Copyright © 2019 Leads Computer. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var seconds: Int?
    @IBOutlet weak var labelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelOutlet.text = String(seconds!)
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
