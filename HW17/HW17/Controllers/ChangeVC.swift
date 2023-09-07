//
//  ChangeViewController.swift
//  HW17
//
//  Created by Роман Литвинович on 6.09.23.
//

import UIKit

class ChangeVC: UIViewController {
    
// Views
    @IBOutlet weak var subView: UIView!
    @IBOutlet var viewForPainting: UIView!
    
// Buttons
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    var closure: ((UIColor) -> Void)?

    @IBAction func changeButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let ColorSettingsVC = storyboard.instantiateViewController(withIdentifier: "ColorSettingsVC") as? ColorSettingsVC else { return }
        self.navigationController?.pushViewController(ColorSettingsVC, animated: true)
        }

    private func setupUI(){
        subView.layer.cornerRadius = subView.frame.size.height / 2
        subView.layer.masksToBounds = true
        
        changeButton.layer.cornerRadius = changeButton.frame.size.height / 2
        changeButton.layer.masksToBounds = true
    }
}
    
