//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import SwiftUI

public struct AppNavHandler: View {
    @StateObject private var viewModel = AppNavHandlerViewModel()

    public init() {}
    
    public var body: some View {
        let firstView: AppRoute = .EventListScreen(mainNav: viewModel)
        NavigationStack(path: $viewModel.appRoutes) {
            firstView
                .navigationsConfig()
        }
    }
}
