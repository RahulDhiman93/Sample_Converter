//
//  FrontPageTableViewCell.swift
//  Converter
//
//  Created by Rahul Dhiman on 17/07/18.
//  Copyright © 2018 Rahul Dhiman. All rights reserved.
//

import UIKit
import EZYGradientView

class FrontPageTableViewCell: UITableViewCell {

    @IBOutlet weak var gView: UIView!
    @IBOutlet weak var cLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addgrad()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addgrad(){
        var wid = CGFloat()
        if DeviceType.IS_IPHONE_X{
            wid = gView.bounds.width+10
        }
        else if DeviceType.IS_IPHONE_6P{
            wid = gView.bounds.width+30
        }
        
        let gradientView = EZYGradientView()
        gradientView.frame = CGRect(x:0,y:0, width: gView.bounds.width+10, height: 100.0)
        gradientView.firstColor = self.hexStringToUIColor(hex: "#fc4a1a")
        gradientView.secondColor = self.hexStringToUIColor(hex: "#f7b733")
        gradientView.angleº = 90.0
        gradientView.colorRatio = 0.5
        gradientView.fadeIntensity = 3.0
        gradientView.isBlur = false
        gradientView.blurOpacity = 0.3
        gradientView.layer.cornerRadius = 10
        gradientView.clipsToBounds = true
        gView.insertSubview(gradientView, at: 0)
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
    
}
