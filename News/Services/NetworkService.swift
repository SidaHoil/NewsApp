//
//  API.swift
//  News
//
//  Created by Sida on 15/10/25.
//

import Foundation
import Alamofire
 
class NetworkService: NetworkServiceProtocol {
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> ()) {
        let headers: HTTPHeaders = ["Content-Type":"application/json" ]
        
        let endPoint = "/v2/everything?q=Apple&from=2025-10-01&sortBy=popularity&apiKey=\(EnvironmentConfig.shared.apiKey)"
        let url = EnvironmentConfig.shared.baseUrl + endPoint
        AF.request(url,headers: headers).responseData {[weak self] response in
            guard let self = self else { return }
            switch response.result{
                case.success(let data):
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("RAW JSON RESPONSE: \(jsonString)")
                    }
                    
                    do {
                        let result = try JSONDecoder().decode(NewsResponse.self, from: data)
                        completion(.success(result.articles))
                    } catch {
                        print("DECODING ERROR:", error)
                        completion(.failure(error))
                    }
                    break
                case .failure(let error):
                    completion(.failure(error))
                    break
            }
        }
            /*.responseDecodable(of: NewsResponse.self) { response in
            switch response.result{
                case .success(let data):
                    completion(.success(data.articles))
                    break
                case .failure(let error):
                    completion(.failure(error))
                    break
            }
        }*/
    }
    
    
}
