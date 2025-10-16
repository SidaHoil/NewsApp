//
//  ProductionConfig.swift
//  News
//
//  Created by Sida on 15/10/25.
//

import Foundation

struct ProductionConfig: ConfigurationProtocol {
    
    var isLoggingEnabled: Bool = false
    
    var analyticsKey: String = ""
    
    var isDebugMenuEnabled: Bool = false
    
    var environmentName: String = "Production"
    
    var apiTimeout: TimeInterval = 10.0
    
    var maxRetryAttempts: Int = 1
    
    var isFeatureXEnabled: Bool = false
    
    var isBetaFeaturesEnabled: Bool = false
    
    
}
