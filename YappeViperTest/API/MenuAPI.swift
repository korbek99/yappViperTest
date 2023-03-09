//
//  MenuAPI.swift
//  YappeViperTest
//
//  Created by Jose David Bustos H on 25-02-23.
//

import Foundation
import Alamofire

/// Public api protocol
protocol MenuAPIProtocol {
    
}
class MenuAPI{
    public func requestData(endpointName: String, method: HTTPMethod, callback: @escaping (Data) -> Void) {
        var headers: [String: String] = ["Content-Type" : "application/json"]
        guard let endpointData = getEndpoint(fromName: endpointName) else {
            callback(Data())
            return
        }
        headers["x-api-key"] = endpointData.APIKey
        if let APIToken = endpointData.APIToken {
            headers["x-api-token"] = APIToken
        }
        debugPrint(endpointData.url.absoluteString)
        if method == .get {
            AF.request(endpointData.url.absoluteString, method: method, encoding: URLEncoding.default).responseData { (response) in
                let responseData = String(data: response.data!, encoding: String.Encoding.utf8)
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        return
                    }
                    callback(data)
                    
                case .failure(let error):
                    callback(Data())
                    print("*** Alamofire GET error: \(error)")
                }
            }
        } else if method == .post {
            AF.request(endpointData.url.absoluteString, method: method, encoding: JSONEncoding.default).responseData { (response) in
                let responseData = String(data: response.data!, encoding: String.Encoding.utf8)
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        return
                    }
                    callback(data)
                    
                case .failure(let error):
                    callback(Data())
                    print(error.localizedDescription)
                }
            }
        } else {
          
            AF.request(endpointData.url.absoluteString, method: method, encoding: JSONEncoding.default).responseJSON { (response) in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        return
                    }
                    callback(data)
                    
                case .failure(let error):
                    callback(Data())
                    print(error.localizedDescription)
                }
            }
        }
        
        
    }
    
    public func getEndpoint(fromName: String) -> APIEndpointModel? {
            var endpointFile = ""
            #if DEBUG
                endpointFile = "endpointsDev"
            #else
                endpointFile = "endpoints"
            #endif
            debugPrint(endpointFile)
            guard let path = Bundle.main.path(forResource: endpointFile, ofType: "plist") else {
                debugPrint("ERROR: No se encontró archivo endpoints.plist")
                return nil
            }
            let myDict = NSDictionary(contentsOfFile: path) as! [String : Any]
            guard let endpoint = myDict[fromName] as? [String : String] else {
                debugPrint("ERROR: No existe endpoint con el nombre \(fromName)")
                return nil
            }
            return APIEndpointModel(url: URL(string: endpoint["url"]!)!, APIKey: endpoint["x-api-key"]!, APIToken: endpoint["x-api-token"])
        }
}
