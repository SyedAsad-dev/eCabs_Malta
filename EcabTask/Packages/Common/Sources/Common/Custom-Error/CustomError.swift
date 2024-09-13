// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum Error: Swift.Error {
    case invalidData(String, String)
}

extension Error: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidData(let title, let message):
            return NSLocalizedString(title, comment: message)
        }
    }
}
