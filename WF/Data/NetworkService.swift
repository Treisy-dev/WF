//
//  NetworkService.swift
//  WF
//
//  Created by Кирилл Щёлоков on 17.05.2023.
//

import Foundation
import Alamofire

final class NetworkService{
    
    static let shared = NetworkService()
    
    private let baseURL = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    
    private init() {}
    
    public func getWordInfo(for word: String, completion: @escaping (Result<[WordInformation], Error>) -> Void)  {
        makeRequest(with: word) { result in
            switch result {
            case .success(let words):
                completion(.success(words))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    private func makeRequest(with word: String,  completion: @escaping (Result<[WordInformation], Error>) -> Void) {
        AF.request(baseURL + word, method: .get).responseData { response in
            switch response.result {
            case .success(let word):
                do{
                    let result = try JSONDecoder().decode([WordInformation].self, from: word)
                    completion(.success(result))
                } catch let error{
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


