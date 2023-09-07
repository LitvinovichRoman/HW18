//
//  ChangeViewController.swift
//  HW17
//
//  Created by Роман Литвинович on 6.09.23.
//

import UIKit


protocol DataUpdateProtocol {
    func onDataUpdate(data: UIColor, transparency: CGFloat)
}

final class ChangeVC: UIViewController {
    
// Views1
    @IBOutlet private  weak var subView: UIView!
    @IBOutlet  var viewForPainting: UIView!{ didSet {
        viewForPainting.backgroundColor = color
        if let transparency = transparency {
                    viewForPainting.alpha = transparency
                }
        }
    }
    
// Buttons
    @IBOutlet private weak var changeButton: UIButton!
    
    var color: UIColor?
    var transparency: CGFloat?
    var delegate: DataUpdateProtocol?
    var complitionHandler: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func changeButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let ColorSettingsVC = storyboard.instantiateViewController(withIdentifier: "ColorSettingsVC") as? ColorSettingsVC else { return }
        self.navigationController?.pushViewController(ColorSettingsVC, animated: true)
        delegate?.onDataUpdate(data: viewForPainting.backgroundColor ?? .white, transparency: 1)
        }

    private func setupUI(){
        subView.layer.cornerRadius = subView.frame.size.height / 2
        subView.layer.masksToBounds = true
        
        changeButton.layer.cornerRadius = changeButton.frame.size.height / 2
        changeButton.layer.masksToBounds = true
    }
}

extension ChangeVC: DataUpdateProtocol {
    func onDataUpdate(data: UIColor, transparency: CGFloat) {
        viewForPainting.backgroundColor = data
        viewForPainting.alpha = transparency
    }
}

