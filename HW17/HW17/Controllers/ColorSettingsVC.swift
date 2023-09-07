//
//  ViewController.swift
//  HW17
//
//  Created by Роман Литвинович on 6.09.23.
//

import UIKit

class ColorSettingsVC: UIViewController {
    // Views
    @IBOutlet var subView: UIView!
    @IBOutlet var testColorView: UIView!

    // Sliders
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    // Buttons
    @IBOutlet var delegatButton: UIButton!
    @IBOutlet var closureButton: UIButton!

    // Text fields
    @IBOutlet var redColorTF: UITextField!
    @IBOutlet var greenColorTF: UITextField!
    @IBOutlet var blueColorTF: UITextField!
    @IBOutlet var hexColorValueTF: UITextField!

    var closure: ((UIColor) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        if let hexString = hexColorValueTF.text {
            let color = UIColor(hexString: hexString)
            testColorView.backgroundColor = color
        }
    }

    @IBAction func redSliderAction(_ sender: UISlider) {
        let redValue = Int(round(redSlider.value))
        redColorTF.text = String(redValue)

        let hexValue = rgbToHex(red: redValue, green: Int(blueSlider.value), blue: Int(greenSlider.value))
        hexColorValueTF.text = hexValue
        updateColor()
    }

    @IBAction func blueSliderAction(_ sender: UISlider) {
        let blueValue = Int(round(blueSlider.value))
        blueColorTF.text = String(blueValue)

        let hexValue = rgbToHex(red: Int(redSlider.value), green: Int(blueSlider.value), blue: blueValue)
        hexColorValueTF.text = hexValue
        updateColor()
    }

    @IBAction func greenSliderAction(_ sender: UISlider) {
        let greenValue = Int(round(greenSlider.value))
        greenColorTF.text = String(greenValue)

        let hexValue = rgbToHex(red: Int(redSlider.value), green: greenValue, blue: Int(blueSlider.value))
        hexColorValueTF.text = hexValue
        updateColor()
    }

    @IBAction func opacitySliderAction(_ sender: UISlider) {
        let opacityValue = sender.value
        testColorView.alpha = CGFloat(opacityValue)
    }

    @IBAction func closureButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let changeVC = storyboard.instantiateViewController(withIdentifier: "ChangeVC") as? ChangeVC else { return }
        self.navigationController?.pushViewController(changeVC, animated: true)
        }
    

   
    
    
    @IBAction func delegatButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let changeVC = storyboard.instantiateViewController(withIdentifier: "ChangeVC") as? ChangeVC else { return }
        self.navigationController?.pushViewController(changeVC, animated: true)
    }

    private func setupUI() {
        subView.layer.cornerRadius = 30
        subView.layer.masksToBounds = true

        delegatButton.layer.cornerRadius = delegatButton.frame.size.height / 2
        delegatButton.layer.masksToBounds = true

        closureButton.layer.cornerRadius = closureButton.frame.size.height / 2
        closureButton.layer.masksToBounds = true

        testColorView.layer.cornerRadius = testColorView.frame.size.height / 2
        testColorView.layer.masksToBounds = true

        testColorView.backgroundColor = testColorView.backgroundColor?.withAlphaComponent(1.0)
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
        testColorView.backgroundColor = color
    }
}

