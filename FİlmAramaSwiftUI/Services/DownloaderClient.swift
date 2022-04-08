//
//  DownloaderClient.swift
//  FİlmAramaSwiftUI
//
//  Created by Berat Yavuz on 4.04.2022.
//

import Foundation
class DownloaderCllient{
   
    func filmleriIndir (search:String, completion : @escaping (Result<[Film]?,DownloaderError>)->Void) {
        
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(search)&apikey=f82a83aa") else {
            
            return completion(.failure(.yanlisUrl))
            
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                return completion(.failure(.veriGelmedi))
                
            }
            
            guard let filmCevabı =  try? JSONDecoder().decode(GelenFilm.self, from: data)
            else{
                return completion(.failure(.veriIslenmedi))
            }
            completion(.success(filmCevabı.filmler))
        }.resume()
        
    }
    
    
    func filmDetayiniIndir (imdbId : String , completion : @escaping (Result<FilmDetay,DownloaderError>)->Void) {
        
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=f82a83aa")  else {return completion(.failure(.yanlisUrl) )}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , error == nil   else{return completion(.failure(.veriGelmedi))}
       
        
            guard let gelenFilmDetayi = try? JSONDecoder().decode(FilmDetay.self, from: data)
            else{
                return completion(.failure(.veriIslenmedi))
                
            }
            
            completion(.success(gelenFilmDetayi))
            
            
        }.resume()
    
        
    }
    

}
    
    
    enum DownloaderError:Error{
        case yanlisUrl
        case veriGelmedi
        case veriIslenmedi
       
    }

