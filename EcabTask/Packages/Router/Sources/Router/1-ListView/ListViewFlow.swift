//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import EventList
import Common
import Domain

class ListScreenRouter: ListScreenRouterProtocol {
    
    let mainNav: NavigationStateProtocol
    init(mainNav: NavigationStateProtocol) {
        self.mainNav = mainNav
    }
    func openDetails(event: GitHubEvent) {
        mainNav.goTo(.app(.DetailsScreen(mainNav: mainNav, character: event)))
    }
}
