//  FiltersVC.swift
//  gradient1
//  Created by Nekokoatl on 17/09/16.

import UIKit
import Foundation

class FiltersVC {

    let allFilters = ["CISepiaTone", "CIPixelate", "CIPhotoEffectTransfer", "CIPhotoEffectNoir"]
    var image: UIImage!
    var tempArray: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempArray = allFilters
        let startImage = UIImage(named: "gib")
        ImageView.image = startImage
    }
    
    @IBAction func filterIt(_ sender: AnyObject) {
        
        if tempArray.count = 0 {
            let startImage = UIImage(named: "gib")
            ImageView.image = startImage
            tempArray = allFilters


        } else {
        
        let fileURL = NSBundle.mainBundle().URLForResource("gib", withExtension: "jpg")
        let startImage = CIImage(contentsOf: fileURL)
        //  remove FIRST O_o
        let filter = CIFilter(name: tempArray.removeFirst())
        filter?.setValue(startImage, forKey: kCIInputImageKey)
        
        let newImage = UIImage(CIImage: filter?.outputImage)
        self.ImageView.image = newImage
        }
    }

}
