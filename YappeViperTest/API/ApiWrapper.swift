//
//  ApiWrapper.swift
//  YappeViperTest
//
//  Created by Jose David Bustos H on 28-02-23.
//

import Foundation

public struct ApiWrapper<T: Codable>: Codable {
    let status: String?
    let payload: T?
}

extension ApiWrapper {
    static func decode(_ data: Data) throws -> ApiWrapper {
        let decoder = JSONDecoder()
        let responseData = String(data: data, encoding: String.Encoding.utf8)
        return try decoder.decode(self, from: data)
    }
    
}

public struct GenericWrapper<T: Codable>: Codable {
    let payload: T?
}

extension GenericWrapper {
    static func decode(_ data: Data) throws -> GenericWrapper {
        let decoder = JSONDecoder()
        let _ = String(data: data, encoding: String.Encoding.utf8)
        return try decoder.decode(self, from: data)
    }
    
}

