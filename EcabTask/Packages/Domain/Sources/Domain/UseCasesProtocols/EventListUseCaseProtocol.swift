//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 12/09/2024.
//

public protocol EventListUseCaseProtocol {
    func execute() async throws -> GitHubEvents
}
