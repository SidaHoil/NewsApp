//
//  DevelopmentConfig.swift
//  News
//
//  Created by Sida on 15/10/25.
//

import Foundation

struct DevelopmentConfig: ConfigurationProtocol {
    
    var isLoggingEnabled: Bool = true
    
    var analyticsKey: String = ""
    
    var isDebugMenuEnabled: Bool = true
    
    var environmentName: String = "Development"
    
    var apiTimeout: TimeInterval = 30.0
    
    var maxRetryAttempts: Int = 3
    
    var isFeatureXEnabled: Bool = true
    
    var isBetaFeaturesEnabled: Bool = true
    
}
