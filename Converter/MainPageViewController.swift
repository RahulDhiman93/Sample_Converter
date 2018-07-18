//
//  MainPageViewController.swift
//  Converter
//
//  Created by Rahul Dhiman on 17/07/18.
//  Copyright © 2018 Rahul Dhiman. All rights reserved.
//

import UIKit
import EZYGradientView

class MainPageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    var arrayLabel = ["LITERS-MILILITERS","GRAM-KILOGRAM","KMPH-MPH","CENTIMETER-METER","INCH-FOOT","CELSIUS-F","KILOMETER-METER","MONEY CONVERTER"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "FrontPageTableViewCell", bundle: nil), forCellReuseIdentifier: "FrontPageTableViewCell")
        
        self.addgrad()
        self.setNavigationBar()
        // Do any additional setup after loading the view.
    }
    
   

}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FrontPageTableViewCell", for: indexPath) as! FrontPageTableViewCell
        cell.cLabel.text = arrayLabel[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayLabel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
}

extension MainPageViewController {
    
    func addgrad(){
        let gradientView = EZYGradientView()
        gradientView.frame = CGRect(x:0,y:0,width:self.view.frame.width,height:self.view.frame.height)
        gradientView.firstColor = self.hexStringToUIColor(hex: "#ff00cc")
        gradientView.secondColor = self.hexStringToUIColor(hex: "#333399")
        gradientView.angleº = 90.0
        gradientView.colorRatio = 0.5
        gradientView.fadeIntensity = 3.0
        gradientView.isBlur = false
        gradientView.blurOpacity = 0.3
        self.view.insertSubview(gradientView, at: 0)
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPHONE_X = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    }
    
    func alert(message:String )
    {
        
        
        
        let alertview = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertview.addAction(UIAlertAction(title: "Try Again!", style: .default, handler: {
            action in
            DispatchQueue.main.async {
                
                //  self.UISetup(enable: true)
            }
        }))
        self.present(alertview, animated: true, completion: nil)
        
    }
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.black
        self.navigationItem.setHidesBackButton(true, animated:true)
       
        
    }
    
    
}
