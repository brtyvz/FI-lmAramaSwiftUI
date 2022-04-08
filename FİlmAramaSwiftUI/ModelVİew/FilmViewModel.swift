//
//  FilmViewModel.swift
//  FİlmAramaSwiftUI
//
//  Created by Berat Yavuz on 5.04.2022.
//

import Foundation
import SwiftUI

class FilmListesiViewModel:ObservableObject{
    @Published var filmler = [FilmViewModel]()
 let downloaderClient = DownloaderCllient()
   
    func filmAramasıYap(filmAdi:String){
        downloaderClient.filmleriIndir(search: filmAdi) { (sonuc) in
            switch sonuc{
            
            case .failure(let hata):
            print(hata.localizedDescription)
            
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi{
                    DispatchQueue.main.async {
                        self.filmler = filmDizisi.map(FilmViewModel.init)
                    }
                 
                }
            
            }
        }
        
    }
    
    
    
}

struct FilmViewModel {
    
    let film : Film
    
    var title : String{
        film.title
        
    }
    var poster : String{
        film.poster
        
    }
    var imdbId : String{
        film.imdbId
    }
    var year : String{
        film.year
    }
    
}


