//
//  ViewController.swift
//  gradient1
//
//  Created by Nekokoatl on 16/09/16.
//  Copyright © 2016 nekokoatl. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBAction func goToFVC(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "filters")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBOutlet var text: UITextView!
    @IBOutlet var label: UILabel!
    
    let viridian = UIColor(red:0.27, green:0.54, blue:0.40, alpha:1.00).cgColor
    let supernova = UIColor(red:1.00, green:0.69, blue:0.23, alpha:1.00).cgColor
    let visVis = UIColor(red:1.00, green:0.94, blue:0.65, alpha:1.00).cgColor
    let roseOfSharon = UIColor(red:0.71, green:0.29, blue:0.15, alpha:1.00).cgColor
    let totemPole = UIColor(red:0.56, green:0.16, blue:0.00, alpha:1.00).cgColor
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [viridian, supernova, visVis, roseOfSharon, totemPole]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradient, at: 0)
        
        _ = Timer.scheduledTimer(
                                                timeInterval:2,
                                                 target: self,
                                                 selector: #selector(ViewController.colorChangeLabel),
                                                 userInfo: nil,
                                                 repeats: true)
        
        _ = Timer.scheduledTimer(timeInterval: 1,
                                 target: self,
                                 selector: #selector(ViewController.colorChangeText),
                                 userInfo: nil,
                                 repeats: true)
        }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning()    }
 
    
    func colorChangeText() {
        let randRed = CGFloat(drand48())
        let randGreen = CGFloat(drand48())
        let randBlue = CGFloat(drand48())
        
        text.textColor = UIColor(red: randRed, green: randGreen, blue: randBlue, alpha:1.00)
    }
    
    func colorChangeLabel() {
        let randRed = CGFloat(drand48())
        let randGreen = CGFloat(drand48())
        let randBlue = CGFloat(drand48())
        
        label.textColor = UIColor(red: randRed, green: randGreen, blue: randBlue, alpha:1.00)
    }
    
}
