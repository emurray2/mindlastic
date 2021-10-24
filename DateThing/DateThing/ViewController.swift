//
//  ViewController.swift
//  DateThing
//
//  Created by Evan Murray on 10/24/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dateFormatter = DateFormatter()
        let dateString = "Sun, 24 Oct 2021 02:52:29"
        dateFormatter.dateFormat = "E, dd MMM yyyy hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        print(dateFormatter.date(from: dateString)!)
    }


}

