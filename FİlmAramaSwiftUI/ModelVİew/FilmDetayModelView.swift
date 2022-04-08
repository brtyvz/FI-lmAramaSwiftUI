//
//  FilmDetayModelView.swift
//  FİlmAramaSwiftUI
//
//  Created by Berat Yavuz on 7.04.2022.
//

import Foundation
import SwiftUI

class FilmDetayModelView:ObservableObject{
    
    @Published var filmDetayi:FilmDetaylariModelView?
    
    let downloaderClient = DownloaderCllient()
    
    func filmDetayiGetir(imdbId:String){
        downloaderClient.filmDetayiniIndir(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            
            case .failure(let hata):
                print(hata)
            
            case .success(let filmDetayi):
                DispatchQueue.main.async {
                    self.filmDetayi = FilmDetaylariModelView(detay: filmDetayi)
                }
            
            
            }
            
        }
        
    }
    
    
    
    
}

struct FilmDetaylariModelView{
    let detay : FilmDetay
    
    var title : String{
        detay.title
    }
    var poster : String{
        detay.poster
    }
    var plot : String{
        detay.plot
    }
    var year : String{
        detay.year
    }
    var actors : String{
        detay.actors
    }
    var imdbRating : String{
        detay.imdbRating
    }
    var director : String{
        detay.director
    }
    var genre : String{
        detay.genre
    }
    
    
    
}
