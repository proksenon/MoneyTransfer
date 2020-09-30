//
//  TreatmentViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Контейнер ViewController модуля Container
final class ContainerViewController: UIViewController {

	var output: ContainerViewOutput?
	var moduleInput: ContainerModuleInput?
	var moduleOutput: MainMouduleInput?
	/// View затемняющаая экран
	private lazy var dimmView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.black.withAlphaComponent(1)
		view.alpha = Alpha.withoutView
		return view
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		guard let output = output else { return }
		output.configureView()
    }

	override func viewDidDisappear(_ animated: Bool) {
		guard let moduleOutput = moduleOutput, let output = output else { return }
		moduleOutput.statusTransaction(with: output.getBalance(), show: output.showStatus())
	}
}
//MARK: -ContainerViewInput
extension ContainerViewController: ContainerViewInput {

	//MARK: -DimmView
	func setupDimmView() {
		dimmView.frame = view.frame
		view.insertSubview(dimmView, at: 1)
	}

	/// Изменяет видимость DimmView
	/// - Parameter isShow: true-увеличивает видимость
	private func dimmViewIsHidden(_ isShow: Bool) {
		self.dimmView.alpha = isShow ? Alpha.mediumView : Alpha.withoutView
	}

	func tapOutSite() {
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        dimmView.addGestureRecognizer(tapGesture)
	}

	/// Нажатие на DimmView, приводит к скрытию ChildController
	@objc private func tapGestureDone(){
		output?.togleTransaction(on: nil)
	}

	func showTransaction(show: Bool, showViewController: UIViewController, y: ViewSize? = nil) {
		if show {
			UIView.animate(withDuration: Duration.fast,
						   delay: 0,
						   usingSpringWithDamping: 0.8,
						   initialSpringVelocity: 0,
						   options: .curveEaseInOut,
						   animations: {
							self.dimmViewIsHidden(show)
							var originY = self.view.frame.height - showViewController.view.frame.height + 20
							if let y = y {
								originY -= y.size
							}
							showViewController.view.frame.origin.y = originY
						},
						   completion: nil)
		} else {
			UIView.animate(withDuration: Duration.fast,
						   delay: 0,
						   usingSpringWithDamping: 0.8,
						   initialSpringVelocity: 0,
						   options: .curveEaseInOut,
						   animations: {
							showViewController.view.endEditing(true)
							self.dimmViewIsHidden(show)
							showViewController.view.frame.origin.y = self.view.frame.height
						},
						   completion: nil)
		}
	}

	
}
