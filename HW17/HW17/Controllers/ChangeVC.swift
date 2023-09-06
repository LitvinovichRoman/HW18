//
//  ChangeViewController.swift
//  HW17
//
//  Created by Роман Литвинович on 6.09.23.
//

import UIKit

class ChangeVC: UIViewController {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var changeButton: UIButton!
    private func setupUI(){
        subView.layer.cornerRadius = subView.frame.size.height / 2
        subView.layer.masksToBounds = true
        
        changeButton.layer.cornerRadius = changeButton.frame.size.height / 2
        changeButton.layer.masksToBounds = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
