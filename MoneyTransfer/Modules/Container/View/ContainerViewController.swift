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
	/// Кнопка возвращает на кран контактов
	private var backButton: UIBarButtonItem?
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
	func setBackButton() {
		backButton = UIBarButtonItem(image: UIImage(systemName: Images.back), style: .done, target: self, action: #selector(backButtonDidTapped))
		backButton?.tintColor = #colorLiteral(red: 0.6702015996, green: 0.6703162789, blue: 0.67018646, alpha: 0.812637544)
		navigationItem.leftBarButtonItem = backButton
	}

	@IBAction func backButtonDidTapped() {
		output?.dissmis()
	}

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
	//MARK: -ShowTransaction
	func showTransaction(show: Bool, view: UIView, y: ViewSize? = nil) {
		if show {
			UIView.animate(withDuration: Duration.fast,
						   delay: 0,
						   usingSpringWithDamping: 0.8,
						   initialSpringVelocity: 0,
						   options: .curveEaseInOut,
						   animations: {
							self.dimmViewIsHidden(show)
							var originY = self.view.frame.height - view.frame.height + 20
							if let y = y {
								originY -= y.size
							}
							view.frame.origin.y = originY
						},
						   completion: nil)
		} else {
			UIView.animate(withDuration: Duration.fast,
						   delay: 0,
						   usingSpringWithDamping: 0.8,
						   initialSpringVelocity: 0,
						   options: .curveEaseInOut,
						   animations: {
							view.endEditing(true)
							self.dimmViewIsHidden(show)
							view.frame.origin.y = self.view.frame.height
						},
						   completion: nil)
		}
	}
	//MARK: -UIPanGestureRecognizer
	func setGesture(views: [UIView]) {
		for view in views {
			let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(panGesture))
			view.addGestureRecognizer(gesture)
		}
	}

	/// Отслеживает gesture
	@IBAction private func panGesture() {
		output?.gestureDidUse()
	}

	/// Передвигает view
	/// - Parameters:
	///   - view: Передвигаемое view
	///   - gesture: Recognaizer
	private func translationMoveView(view: UIView, gesture: UIPanGestureRecognizer) {
		let translation = gesture.translation(in: view)
		let minY = view.frame.minY

		if (minY + translation.y >= 0) && (minY + translation.y <= ViewConstatns.height) {
			view.frame = CGRect(x: 0, y: minY + translation.y, width: view.frame.width, height: view.frame.height)
			gesture.setTranslation(CGPoint.zero, in: view)
		}
	}

	func moveView(with view: UIView) {
		guard let gesture = view.gestureRecognizers?.first as? UIPanGestureRecognizer else { return }
		translationMoveView(view: view, gesture: gesture)

		if gesture.state == .ended {
			if gesture.velocity(in: view).y >= 0  {
				showTransaction(show: false, view: view, y: ViewSize(size: -view.frame.origin.y))
			} else {
				showTransaction(show: true, view: view, y: ViewSize(size: view.frame.height))
			}
		}
	}
}
