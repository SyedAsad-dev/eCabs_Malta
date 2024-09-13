//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import SwiftUI

public struct ViewDidLoadModifier: ViewModifier {
    @State private var viewDidLoad = false
    
    let action: () -> ()
    
    public func body(content: Content) -> some View {
        content
            .onAppear{
                if viewDidLoad == false {
                    viewDidLoad = true
                    action()
                }
            }
    }
}

extension View {
    public func onViewDidLoad(perform action: @escaping () -> ()) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
