//
//  UIViewController+Preview.swift
//  FitnessTracker
//
//  Created by Вадим Гамзаев on 01.04.2023.
//

import UIKit
import SwiftUI

extension UIViewController {
	struct Preview: UIViewControllerRepresentable {
		let viewController: UIViewController
		
		func makeUIViewController(context: Context) -> some UIViewController {
			viewController
		}
		
		func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
	}
	
	func preview() -> some View {
		Preview(viewController: self).edgesIgnoringSafeArea(.all)
	}
}
