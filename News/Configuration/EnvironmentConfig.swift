//
//  EnvironmentConfig.swift
//  News
//
//  Created by Sida on 15/10/25.
//

import Foundation

struct EnvironmentConfig {
    static let shared = EnvironmentConfig()
    var baseUrl: String {
        let domain = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
        return "https://" + domain
    }
    
    var apiKey: String{
        return Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
    }
    
    var currentEnv: ConfigurationProtocol{
        #if DEV_ENVIRONMENT
            return DevelopmentConfig()
        #elseif STAGING_ENVIRONMENT
            return StagingConfig()
        #else
            return ProductionConfig()
        #endif
    }
    
}
