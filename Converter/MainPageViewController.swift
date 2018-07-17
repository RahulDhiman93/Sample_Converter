//
//  MainPageViewController.swift
//  Converter
//
//  Created by Rahul Dhiman on 17/07/18.
//  Copyright © 2018 Rahul Dhiman. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FrontPageTableViewCell", bundle: nil), forCellReuseIdentifier: "FrontPageTableViewCell")
        // Do any additional setup after loading the view.
    }

}
