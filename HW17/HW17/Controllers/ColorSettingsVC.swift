//
//  ViewController.swift
//  HW17
//
//  Created by Роман Литвинович on 6.09.23.
//

import UIKit

final class ColorSettingsVC: UIViewController {
    
    // Views
    @IBOutlet private var subView: UIView!
    @IBOutlet private var testColorView: UIView!

    // Sliders
    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueSlider: UISlider!
    @IBOutlet var opacitySlider: UISlider!
    
    // Buttons
    @IBOutlet private var delegatButton: UIButton!
    @IBOutlet private var closureButton: UIButton!

    // Text fields
    @IBOutlet private var redColorTF: UITextField!
    @IBOutlet private var greenColorTF: UITextField!
    @IBOutlet private var blueColorTF: UITextField!
    @IBOutlet private var hexColorValueTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        if let hexString = hexColorValueTF.text, !hexString.isEmpty {
            let color = UIColor(hexString: hexString)
            testColorView.backgroundColor = color
        }
    }
        
    @IBAction func redSliderAction(_ sender: UISlider) {
        updateColorComponents()
    }
        
    @IBAction func blueSliderAction(_ sender: UISlider) {
        updateColorComponents()
    }
        
    @IBAction func greenSliderAction(_ sender: UISlider) {
        updateColorComponents()
    }
        
    @IBAction func opacitySliderAction(_ sender: UISlider) {
        let opacityValue = sender.value
        testColorView.alpha = CGFloat(opacityValue)
        updateColor()
    }
        
    @IBAction func closureButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let changeVC = storyboard.instantiateViewController(withIdentifier: "ChangeVC") as? ChangeVC else { return }
            
        changeVC.color = testColorView.backgroundColor
        changeVC.transparency = testColorView.alpha
            
        self.navigationController?.pushViewController(changeVC, animated: false)
            
        changeVC.complitionHandler = { [weak self] in
            self?.testColorView.backgroundColor = changeVC.viewForPainting.backgroundColor
            self?.testColorView.alpha = changeVC.transparency ?? 1
        }
    }

    @IBAction func delegatButtonAction(_ sender: Any) {
        openChangeVC()
    }

    private func setupUI() {
        subView.roundView()
        testColorView.roundViewForHeight()
        testColorView.backgroundColor = testColorView.backgroundColor?.withAlphaComponent(1.0)
        
        delegatButton.roundButton()
        closureButton.roundButton()
    }

    private func rgbToHex(red: Int, green: Int, blue: Int) -> String {
        let redHex = String(format: "%02X", red)
        let greenHex = String(format: "%02X", green)
        let blueHex = String(format: "%02X", blue)

        return "#" + redHex + greenHex + blueHex
    }

    private func updateColor() {
        guard let hexString = hexColorValueTF.text else { return }
        let color = UIColor(hexString: hexString)
        let transparency = CGFloat(opacitySlider.value)
        testColorView.backgroundColor = color
        testColorView.alpha = transparency
    }
    
    private func updateColorComponents() {
        let redValue = Int(round(redSlider.value))
        redColorTF.text = String(redValue)
           
        let greenValue = Int(round(greenSlider.value))
        greenColorTF.text = String(greenValue)
           
        let blueValue = Int(round(blueSlider.value))
        blueColorTF.text = String(blueValue)
           
        let hexValue = rgbToHex(red: redValue, green: greenValue, blue: blueValue)
        hexColorValueTF.text = hexValue
           
        updateColor()
    }
    
    private func openChangeVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let changeVC = storyboard.instantiateViewController(withIdentifier: "ChangeVC") as? ChangeVC else { return }
        changeVC.color = testColorView.backgroundColor
        changeVC.transparency = testColorView.alpha

        self.navigationController?.pushViewController(changeVC, animated: false)
    }
}
