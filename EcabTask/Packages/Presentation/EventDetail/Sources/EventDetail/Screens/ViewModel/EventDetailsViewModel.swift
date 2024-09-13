//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import Domain

public final class EventDetailsViewModel {
    let event: GitHubEvent
    
    public init(
        event:GitHubEvent
    ) {
        self.event = event
    }
    
}
