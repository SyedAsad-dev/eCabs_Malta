//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import UIKit
import SwiftUI
import Domain

struct EventsTableView: UIViewRepresentable {
     
    var viewModel: EventListViewModel
    var frame: CGRect
    
    var actionCallback: ((GitHubEvent) -> Void)?
    
    
    func makeUIView(context: Context) -> UIView {
        let uiView = EventsScrollView(frame: frame, viewModel: viewModel)
        uiView.backgroundColor = .clear
        
        uiView.didTap = actionCallback
        
        return uiView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.backgroundColor = .clear
    }
}
