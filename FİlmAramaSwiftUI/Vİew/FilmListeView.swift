//
//  ContentView.swift
//  FİlmAramaSwiftUI
//
//  Created by Berat Yavuz on 4.04.2022.
//

import SwiftUI

struct FilmListeView: View {
    
   @ObservedObject var filmListeViewModel : FilmListesiViewModel
    @State var aranacakFilm = ""
    init() {
        self.filmListeViewModel = FilmListesiViewModel()
       
    }
    var body: some View {
        
        NavigationView{
            VStack{
            TextField(" Film Ara", text: $aranacakFilm) { _ in} onCommit: {
                self.filmListeViewModel.filmAramasıYap(filmAdi:aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm )
            }.padding()

            
        List(filmListeViewModel.filmler, id: \.imdbId  ){film in
            NavigationLink(destination: DetayView(imdbId: film.imdbId)) {
                HStack(){
                    OzelImage(url: film.poster).frame(width: 90, height: 110, alignment: .center)
                    
                    VStack(alignment:.leading){
                        
                        
                        Text(film.title).bold().font(.title3).foregroundColor(.orange)
                        
                        Text(film.year).foregroundColor(.blue)
                        
                    }
                    
                    
                    
                }
            }
            
        }.navigationTitle(Text("Film Listesi"))
        }
        }
    }
    }
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}
