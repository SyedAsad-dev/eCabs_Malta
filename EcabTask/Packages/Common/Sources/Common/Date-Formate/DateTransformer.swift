//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation

// Date transformation utility for parsing and formatting dates
public struct DateTransformer {
    // Method to convert a date string from ISO 8601 format to a readable format
    public static func toReadableFormat(_ dateString: String) -> String {
        // Convert the ISO 8601 date string to a Date object
        guard let date = iso8601Formatter.date(from: dateString) else {
            return dateString // Return original string if parsing fails
        }
        // Convert the Date object to a readable string
        return readableFormatter.string(from: date)
    }

    // Formatter for ISO 8601 format (used by GitHub API)
    public static let iso8601Formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()

    // Formatter for displaying dates in a readable format
    private static let readableFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy, h:mm a" // Customize as needed
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter
    }()
}
