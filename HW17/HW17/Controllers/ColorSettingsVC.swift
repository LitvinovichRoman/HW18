//
//  ViewController.swift
//  HW17
//
//  Created by Роман Литвинович on 6.09.23.
//

import UIKit

class ColorSettingsVC: UIViewController {

    @IBOutlet weak var subView: UIView!
    
    // Sliders
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setupUI(){
        subView.layer.cornerRadius = 30
        subView.layer.masksToBounds = true
        
//        let gradientLayer = CAGradientLayer()
//               gradientLayer.frame = redSlider.bounds
//               gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.red.cgColor]
//        
//               redSlider.layer.insertSublayer(gradientLayer, at: 1)
        
    }

}

