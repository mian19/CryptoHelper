//
//  APICaller.swift
//  CryptoHelper
//
//  Created by Kyzu on 22.04.22.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    
    private struct Constant {
        static let apiKey = "65d826b99ad9177574292332ff03b21ca80d24b6"
        static let assetsEndpoint = "https://api.nomics.com/v1/currencies/"
    }
    
    private init() {
        
    }
    
    func getAllCryptoData( complition: @escaping (Result<[Crypto], Error>) -> Void ) {
        guard let url = URL(string: Constant.assetsEndpoint + "ticker?key=" + Constant.apiKey + "&ranks=1&interval=1d,30d&convert=USD&per-page=10&page=1") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let jsonResult = try JSONDecoder().decode([Crypto].self, from: data)
                complition(.success(jsonResult))
            } catch {
                complition(.failure(error))
            }
        }
        task.resume()
    }
    
}
