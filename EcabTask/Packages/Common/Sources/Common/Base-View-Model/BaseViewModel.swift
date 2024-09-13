//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import SwiftUI

@Observable
open class BaseViewModel: NSObject {
    
    public override init() {}
    
    public var dataStatus: DataState?{
        didSet {
            switch dataStatus{
            case let .failure(err):
                presentableError = err.localizedDescription
                if isLoading == true {
                    isLoading = false
                }
                showAlert = true
            case let .success(value):
                switch value {
                case .loading:
                    isLoading = true
                case let .finished(Outcome):
                    isLoading = false
                    switch Outcome {
                    case .success:
                        presentableError = ""
                        showAlert = false
                    }
                }
            default:
                break
            }
        }
    }
    
    public var isLoading = false
    public var showAlert = false
    public var presentableError = ""
    
//    public let defaultError = NSError(domain: "SomeThing went wrong please try again later", code: 0)
}




