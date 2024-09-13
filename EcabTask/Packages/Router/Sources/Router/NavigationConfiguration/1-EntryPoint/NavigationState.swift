//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import SwiftUI

public protocol NavigationStateProtocol {
    func goTo(_ route:Route)
    func goBack()
}

public final class AppNavHandlerViewModel: NavigationStateProtocol , ObservableObject {
    
    @Published public var appRoutes: [Route] = []
    

    public func goTo(_ route:Route) {
        Task {
            await MainActor.run {
                appRoutes.append(route)
            
            }
        }
    }
    
    public func goBack() {
        Task {
            await MainActor.run {
                _ = appRoutes.popLast()
            }
        }
    }
}
