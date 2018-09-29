//
//  GetFilmResponse.swift
//  iTRexTest
//
//  Created by Слава on 30.09.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import Foundation

struct GetFilmResponse {
    
    let films: [Film]
    
    init?(json: Any) {
        guard let dict = json as? [String: Any] else { return nil }
        
        guard let arrayOfFilms = dict["list"] as? [[String: Any]] else { return nil }
        
        var films = [Film]()
        
        for dict in arrayOfFilms {
            guard let film = Film(dict: dict) else { continue }
            films.append(film)
        }
        
        self.films = films
    }
    
    
}
