//
//  ActivityIndicator.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 19.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable {

    func updateUIView(_ indicator: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
		indicator.startAnimating()
    }
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
		let indicator = UIActivityIndicatorView()
		indicator.hidesWhenStopped = true
        return indicator
    }
	
}
