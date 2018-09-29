//
//  DataService.swift
//  iTRexTest
//
//  Created by Слава on 27.09.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import Foundation

class FilmNetworkService {
    
    private init() {}
    
    static func getFilms(completion: @escaping(GetFilmResponse) -> ()) {
        
        var dataUrlComponents = URLComponents()
        
        dataUrlComponents.scheme = "http"
        dataUrlComponents.host = "www.mocky.io"
        dataUrlComponents.path = "/v2/57cffac8260000181e650041"
        
        guard let url = dataUrlComponents.url else { return }
        
        NetworkService.shared.getData(url: url) { (json) in
            
            guard let film = GetFilmResponse(json: json) else { return }
            
            completion(film)
            
        }
        
    }
    
}



