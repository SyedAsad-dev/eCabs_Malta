//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import SwiftUI

public struct NavigationModifier: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .navigationDestination(for: Route.self) { $0 }
    }
}

public extension View {
    func navigationsConfig() -> some View {
        self.modifier(NavigationModifier())
    }
}
