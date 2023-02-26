//
//  ApierrorModel.swift
//  YappeViperTest
//
//  Created by Jose David Bustos H on 25-02-23.
//

import Foundation
typealias APIErrorViewModel = APIMenuErrorModel.ViewModel
typealias APIErrorResponse = APIMenuErrorModel.Response

enum APIMenuErrorModel {
    struct Request {
    }
    struct Response: Equatable {
        let title: String
        let message: String
        let code: Int
    }
    struct ViewModel {
        let title: String
        let message: String
        let icon: String
        let code: String
        var animated: Bool = true
    }
}
