//
//  StagingConfig.swift
//  News
//
//  Created by Sida on 15/10/25.
//

import Foundation

struct StagingConfig: ConfigurationProtocol {
    
    var isLoggingEnabled: Bool = true
    
    var analyticsKey: String = ""
    
    var isDebugMenuEnabled: Bool = false
    
    var environmentName: String = "Staging"
    
    var apiTimeout: TimeInterval = 15.0
    
    var maxRetryAttempts: Int = 2
    
    var isFeatureXEnabled: Bool = true
    
    var isBetaFeaturesEnabled: Bool = false
}
