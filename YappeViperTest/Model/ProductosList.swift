//
//  ProductosList.swift
//  YappeViperTest
//
//  Created by Jose David Bustos H on 25-02-23.
//

import Foundation

// MARK: - Empty
struct ProductosList: Decodable {
    let status: String
    let products: [Product]
}

// MARK: - Product
struct Product: Decodable {
    let id: String
    let name: String
    let desc: String
    let price: Int
    let image: String
    let page: String
    let latitude: String
    let longitude: String
}
