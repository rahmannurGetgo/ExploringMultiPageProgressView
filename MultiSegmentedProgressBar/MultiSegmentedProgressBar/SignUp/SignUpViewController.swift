//
//  SignUpViewController.swift
//  MultiSegmentedProgressBar
//
//  Created by Rahmannur Rizki Syahputra on 07/09/22.
//

import Foundation
import UIKit
import MultiProgressView

protocol SignUpVCProtocol: AnyObject {
	func updateProgressBar(first: Float, second: Float, third: Float)
	func updateContainerView(childVCID: String)
}

class SignUpViewController: UIViewController {
	
	@IBOutlet weak var progressView1: MultiProgressView!
	@IBOutlet weak var progressView2: MultiProgressView!
	@IBOutlet weak var progressView3: MultiProgressView!
	@IBOutlet weak var signUpContainerView: UIView!

	var pageCounter: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		progressView1.dataSource = self
		progressView2.dataSource = self
		progressView3.dataSource = self
		setupProgressView(first: 0.5, second: 0, third: 0)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		setupView()
	}
	
	private func setupView() {
		let storyboard = UIStoryboard(name: "SignUpSteps", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "signUpStep1") as! SignUpStep1VC
		vc.delegate = self
		let storyboard2 = UIStoryboard(name: "SignUpSteps", bundle: nil)
		let vc2 = storyboard2.instantiateViewController(withIdentifier: "signUpStep2") as! SignUpStep2VC
		vc2.delegate = self
		self.add(asChildViewController: vc, containerView: signUpContainerView)
	}
	
	private func setupProgressView(first: Float, second: Float, third: Float) {
		progressView1.setProgress(section: 0, to: first)
		progressView2.setProgress(section: 0, to: second)
		progressView3.setProgress(section: 0, to: third)
	}
	
//	@objc private func didTapNext() {
//		pageCounter += 1
//		if pageCounter == 1 {
//			let storyboard = UIStoryboard(name: "SignUpSteps", bundle: nil)
//			let vc = storyboard.instantiateViewController(withIdentifier: "signUpStep2")
//			self.add(asChildViewController: vc, containerView: signUpContainerView)
//			setupProgressView(first: 1.0, second: 0.5, third: 0)
//		} else if pageCounter == 2 {
//			let storyboard = UIStoryboard(name: "SignUpSteps", bundle: nil)
//			let vc = storyboard.instantiateViewController(withIdentifier: "signUpStep3")
//			self.add(asChildViewController: vc, containerView: signUpContainerView)
//			setupProgressView(first: 1.0, second: 1.0, third: 0.5)
//		}
//
//	}
}

extension SignUpViewController: MultiProgressViewDataSource, MultiProgressViewDelegate {
	func numberOfSections(in progressView: MultiProgressView) -> Int {
		return 2
	}
	
	func progressView(_ progressView: MultiProgressView, viewForSection section: Int) -> ProgressViewSection {
		
		let view = ProgressViewSection()
		return view
	}
}

extension SignUpViewController: SignUpVCProtocol {
	func updateContainerView(childVCID: String) {
		if childVCID.contains("2") {
			let storyboard = UIStoryboard(name: "SignUpSteps", bundle: nil)
			let vc = storyboard.instantiateViewController(withIdentifier: childVCID) as! SignUpStep2VC
			vc.delegate = self
			self.add(asChildViewController: vc, containerView: signUpContainerView)
		} else if childVCID.contains("3") {
			let storyboard = UIStoryboard(name: "SignUpSteps", bundle: nil)
			let vc = storyboard.instantiateViewController(withIdentifier: childVCID) as! SignUpStep3VC
			vc.delegate = self
			self.add(asChildViewController: vc, containerView: signUpContainerView)
		}
	}
	
	func updateContainerView(asChildVC: UIViewController) {
		
		self.add(asChildViewController: asChildVC, containerView: signUpContainerView)
	}
	
	
	func updateProgressBar(first: Float, second: Float, third: Float) {
		setupProgressView(first: first, second: second, third: third)
	}
}

extension UIViewController {
	public func add(asChildViewController viewController: UIViewController, containerView: UIView) {
		// Add Child View Controller
		addChild(viewController)
		viewController.view.frame = containerView.frame
		view.addSubview(viewController.view)
		viewController.didMove(toParent: self)
	}
	
	public func remove(asChildViewController viewController: UIViewController) {
		// Notify Child View Controller
		viewController.willMove(toParent: nil)
		
		// Remove Child View From Superview
		viewController.view.removeFromSuperview()
		
		// Notify Child View Controller
		viewController.removeFromParent()
	}
}
