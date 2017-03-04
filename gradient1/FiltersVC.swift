//  FiltersVC.swift
//  gradient1
//  Created by Nekokoatl on 17/09/16.

import UIKit
import Foundation

class FiltersVC: UIViewController  {

    @IBOutlet var filterName: UILabel!
    
    @IBOutlet var image: UIImageView!
    
 let allFilters: Array = [
    "CIPixelate",
    "CIPhotoEffectTransfer",
    "CIPhotoEffectNoir",
    "CIColorClamp",
    "CIColorControls",
    "CIColorMatrix",
    "CIColorPolynomial",
    "CIExposureAdjust",
    "CIGammaAdjust",
    "CIHueAdjust",
    "CILinearToSRGBToneCurve",
    "CISRGBToneCurveToLinear",
    "CITemperatureAndTint",//
    "CIToneCurve",
    "CIVibrance",//
    "CIWhitePointAdjust",
    "CIColorCrossPolynomial",
    "CIColorCube",
    "CIColorCubeWithColorSpace",
    "CIColorInvert",
    "CIColorMap",
    "CIColorMonochrome",
    "CIColorPosterize",
    "CIFalseColor",
    "CIMaskToAlpha",
    "CIMaximumComponent",
    "CIMinimumComponent",
    "CIPhotoEffectChrome",
    "CIPhotoEffectFade",
    "CIPhotoEffectInstant",
    "CIPhotoEffectMono",
   "CIPhotoEffectNoir",
    "CIPhotoEffectProcess",
    "CIPhotoEffectTonal",
    "CIPhotoEffectTransfer",
    "CISepiaTone",
    "CIVignette",
    "CIVignetteEffect"
    ]
    
    var somewhat: Int = 0
    var randomIndex: Int = 0
    var tempArray: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterName.text = "mushroom"
        filterName.textColor = UIColor(red:0.27, green:0.54, blue:0.40, alpha:1.00)

        tempArray = allFilters
        _ = image.image
    }
    
    @IBAction func filterIt(_ sender: AnyObject) {
        let somewhat = allFilters.count
        let randomIndex = Int(arc4random_uniform(UInt32(somewhat)))
        
        let fileURL = Bundle.main.url(forResource: "gib", withExtension: "jpg")
        let startImage = CIImage(contentsOf: fileURL!)
        
        let filter = CIFilter(name: allFilters[randomIndex])
            filter?.setValue(startImage, forKey: kCIInputImageKey)
            let firstImg = (ciImage: (filter?.outputImage))
                let newImage = convert(cmage: firstImg!)
                self.image.image = newImage
                filterName.text = String(describing: filter?.name)
                self.colorChangeLabel()
    }
    
    func convert(cmage:CIImage) -> UIImage {
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        return image
    }
    
    func colorChangeLabel() {
        let randRed = CGFloat(drand48())
        let randGreen = CGFloat(drand48())
        let randBlue = CGFloat(drand48())
        
        filterName.textColor = UIColor(red: randRed, green: randGreen, blue: randBlue, alpha:1.00)
    }
}


