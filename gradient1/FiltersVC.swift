//  FiltersVC.swift
//  gradient1
//  Created by Nekokoatl on 17/09/16.

import UIKit
import Foundation

class FiltersVC: UIViewController  {

    
    @IBOutlet var image: UIImageView!
    
      public let allFilters: Array = ["CISepiaTone", "CIPixelate", "CIPhotoEffectTransfer", "CIPhotoEffectNoir"]
//  let allFilters: Array = ["CISepiaTone", "CIPixelate", "CIPhotoEffectTransfer", "CIPhotoEffectNoir"]
    
 //   var somewhat: Int = allFilters.count
    var somewhat: Int = 0
   var randomIndex: Int = 0
    //    var image: UIImage!
    var tempArray: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempArray = allFilters
        _ = image.image
 //       image.image = startImage
    }
    
    @IBAction func filterIt(_ sender: AnyObject) {
        var somewhat = allFilters.count
         var randomIndex = Int(arc4random_uniform(UInt32(somewhat)))

        
    //    if tempArray.count == 0 {
       //     let startImage = image.image
   //         image.image = startImage
  //          tempArray = allFilters


 //       } else {
        
        let fileURL = Bundle.main.url(forResource: "gib", withExtension: "jpg")
        var startImage = CIImage(contentsOf: fileURL!)
        //  remove FIRST O_o
        let filter = CIFilter(name: allFilters[randomIndex])
  //      Int(arc4random_uniform(UInt32(randomFltr)))
        filter?.setValue(startImage, forKey: kCIInputImageKey)
        
        let newImage = UIImage(ciImage: (filter!.outputImage)!)
        self.image.image = newImage
        }
    }


