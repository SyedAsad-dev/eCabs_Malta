//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation

enum AppBaseURL: String, Codable {
    case staging = "https://api.github.com/events"
}

class AppConfigManager {
    static let shared = AppConfigManager()
    
    //MARK: BaseURL
    func selectBaseUrl(_ url: AppBaseURL) {
        NetworkingAppDefault.shared.save(url, forKey: .baseUrl)
    }
    
    func getSelectedBaseURL() -> String {
        guard let baseUrl: AppBaseURL = NetworkingAppDefault.shared.get(.baseUrl) else { return AppBaseURL.staging.rawValue }
        return baseUrl.rawValue
    }
}
