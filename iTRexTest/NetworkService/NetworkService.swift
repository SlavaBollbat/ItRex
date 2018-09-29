//
//  NetworkService.swift
//  iTRexTest
//
//  Created by Слава on 29.09.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    func getData(url: URL, completion: @escaping (Any) -> ()) {
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error)
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch let error {
                print(error)
            }
            
        }
        
        task.resume()
        
    }
    
    
}
