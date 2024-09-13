//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import SwiftUI
public struct LoaderModifier: ViewModifier {
    
    @Binding var showLoader: Bool
    
    public func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(showLoader)
            ProgressView("").controlSize(.large)
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showLoader ? 1 : 0)
                .animation(.linear(duration: 0.5), value: showLoader)
        }
    }
}

extension View {
    public func LoadingConfig(show: Binding<Bool>) -> some View {
        self.modifier(LoaderModifier(showLoader: show))
    }
}
