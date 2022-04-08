//
//  DetayView.swift
//  FİlmAramaSwiftUI
//
//  Created by Berat Yavuz on 7.04.2022.
//

import SwiftUI

struct DetayView: View {
    var imdbId : String
    @ObservedObject var filmDetayViewModel = FilmDetayModelView()
    var body: some View {
        VStack{
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "film detayi gösterilcek")
            Text(filmDetayViewModel.filmDetayi?.actors ?? "film detayi gösterilcek")
            Text(filmDetayViewModel.filmDetayi?.title ?? "film detayi gösterilcek")
            Text(filmDetayViewModel.filmDetayi?.poster ?? "film detayi gösterilcek")
            
            
        }.onAppear(perform: {self.filmDetayViewModel.filmDetayiGetir(imdbId: imdbId)}
        )
        
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "deneme")
    }
}
