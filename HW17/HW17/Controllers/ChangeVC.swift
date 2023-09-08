//
//  ChangeViewController.swift
//  HW17
//
//  Created by Роман Литвинович on 6.09.23.
//

import UIKit

protocol DataUpdateProtocol {
    func onDataUpdate(data: UIColor)
}

final class ChangeVC: UIViewController {
    
    // Views
    @IBOutlet private var subView: UIView!
    @IBOutlet var viewForPainting: UIView! { didSet { viewForPainting.backgroundColor = color
        if let transparency = transparency { viewForPainting.alpha = transparency } } }

    // Buttons
    @IBOutlet private var changeButton: UIButton!
    
    // References
    var color: UIColor?
    var transparency: CGFloat?
   
    // For data
    var delegate: DataUpdateProtocol?
    var complitionHandler: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func changeButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let ColorSettingsVC = storyboard.instantiateViewController(withIdentifier: "ColorSettingsVC") as? ColorSettingsVC else { return }
        self.navigationController?.pushViewController(ColorSettingsVC, animated: false)
        delegate?.onDataUpdate(data: viewForPainting.backgroundColor ?? .white)
    }

    private func setupUI() {
        subView.roundViewForHeight()
        changeButton.roundButton()
    }
}

extension ChangeVC: DataUpdateProtocol {
    func onDataUpdate(data: UIColor) {
        viewForPainting.backgroundColor = data

        delegate?.onDataUpdate(data: viewForPainting.backgroundColor ?? .white)
    }
}
