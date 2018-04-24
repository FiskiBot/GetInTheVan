//
//  ViewController.swift
//  getInTheVan
//
//  Created by Patrick Moening on 4/23/18.
//  Copyright © 2018 Patrick Moening. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var gasTank: UIProgressView!
    @IBOutlet weak var mileMarker: UIProgressView!
    @IBOutlet weak var milesUntilDestinationLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    var milesPerGallon = 13.5
    var milesPerHour = 60.0
    var milesUntilPost = 0.0
    var gasMax = 20.0
    var gas = 0.0
    
    var milesToDestination = 174.0
    var timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(drive), userInfo: nil, repeats: true)
        gas = gasMax
        gasTank.progress = Float(gas / gasMax)
        milesUntilDestinationLbl.text = "Miles To Destination: \(milesToDestination) mi"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func drive() {
        if milesUntilPost <= milesPerHour {
            milesUntilPost += 1.0
            mileMarker.progress = Float(milesUntilPost / milesPerHour)
            
        } else {
            mileMarker.progress = 0.0
            milesUntilPost = 0.0
            gas -= milesPerHour / milesPerGallon
            gasTank.progress = Float(gas / gasMax)
            milesToDestination -= milesPerHour
            milesUntilDestinationLbl.text = "Miles To Destination: \(milesToDestination) mi"
        }
        
        
    }

}

