//
//  CatController.swift
//  Marvel
//
//  Created by shinjiun on 2021/07/07.
//

import Foundation

func requestGet(url: String, completionHandler: @escaping (String, Any) -> Void) {
    guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            return
        }
    var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            guard let output = try? JSONDecoder().decode(CatModel.self, from: data) else {
                print("Error: JSON Data Parsing failed")
                return
            }
            
            completionHandler("String", output.message)
        }.resume()
    
    
}


