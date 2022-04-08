//
//  Film.swift
//  FİlmAramaSwiftUI
//
//  Created by Berat Yavuz on 4.04.2022.
//

import Foundation

// Api verilerini işleyebilmek için codable oldu
struct Film : Codable{
    
    let  title : String
    let year : String
    let imdbId : String
    let poster : String
    let type : String
    
    private enum CodingKeys : String , CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
        case type = "Type"
        
    }
}


struct GelenFilm : Codable {
    let filmler : [Film]
    
    
    private enum  CodingKeys : String, CodingKey{
        case filmler = "Search"
    }
    
}
