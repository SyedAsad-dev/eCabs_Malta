//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import EventDetail

class DetailsScreenRouter: DetailsScreenRouterProtocol {

    let mainNav: NavigationStateProtocol
    init(mainNav: NavigationStateProtocol) {
        self.mainNav = mainNav
    }
    func goBack() {
        mainNav.goBack()
    }
}
