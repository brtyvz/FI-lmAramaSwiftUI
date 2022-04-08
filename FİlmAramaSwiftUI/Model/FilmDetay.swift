//
//  FilmDetay.swift
//  FİlmAramaSwiftUI
//
//  Created by Berat Yavuz on 7.04.2022.
//

import Foundation
class FilmDetay:Codable{
    
    let title : String
    let year : String
    let genre : String
    let director : String
    let writer : String
    let actors : String
    let plot : String
    let awards : String
    let poster : String
    let metascore : String
    let imdbRating : String
    let idbId : String
    
    
    private enum CodinKeys : String ,  CodingKey {
        
         case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case awards = "Awards"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"
        
        
        
        
    }
    
    
    
}
