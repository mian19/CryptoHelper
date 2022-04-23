//
//  ModelsJSON.swift
//  CryptoHelper
//
//  Created by Kyzu on 23.04.22.
//

import Foundation

struct Crypto: Codable {
    let id: String?
    let currency: String?
    let price: String?
    let symbol: String?
    let name: String?
}
