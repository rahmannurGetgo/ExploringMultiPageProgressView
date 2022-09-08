//
//  ViewController.swift
//  MultiSegmentedProgressBar
//
//  Created by Rahmannur Rizki Syahputra on 07/09/22.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var signUpBtn: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func didTappedSignUp(_ sender: Any) {
		let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "firstSignUp")
		navigationController?.pushViewController(vc, animated: true)
	}
	
}

