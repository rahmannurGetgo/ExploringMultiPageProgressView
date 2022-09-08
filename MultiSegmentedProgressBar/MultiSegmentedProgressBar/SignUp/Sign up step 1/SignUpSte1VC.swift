//
//  SignUpSte1VC.swift
//  MultiSegmentedProgressBar
//
//  Created by Rahmannur Rizki Syahputra on 07/09/22.
//

import Foundation
import UIKit

class SignUpStep1VC: UIViewController {
	
	@IBOutlet weak var nextBtn: UIButton!
	weak var delegate: SignUpVCProtocol?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		nextBtn.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
	}
	
	@objc private func didTapNext() {
		delegate?.updateProgressBar(first: 1.0, second: 0.5, third: 0)
//		let storyboard = UIStoryboard(name: "SignUpSteps", bundle: nil)
//		let vc = storyboard.instantiateViewController(withIdentifier: "signUpStep2")
		delegate?.updateContainerView(childVCID: "signUpStep2")
	}
}
