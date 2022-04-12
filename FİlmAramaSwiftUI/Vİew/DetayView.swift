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
        ScrollView(.vertical){
            VStack(alignment:.leading){
                HStack{
                    Spacer()
                    
                    OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.width*0.6, height: UIScreen.main.bounds.height*0.4, alignment: .center).cornerRadius(20.0).offset( y:-20)
                    
                    Spacer()
                }
                          
            
                HStack{
                    Spacer()
                    Text(filmDetayViewModel.filmDetayi?.title ?? "film detayi gösterilcek").font(.title).foregroundColor(.blue)
                    Spacer()
                }
            
                HStack{Text("Genre").foregroundColor(.blue).font(.title2).padding()
                    Text(filmDetayViewModel.filmDetayi?.genre ?? "film detayi gösterilcek")
                }.padding()
                HStack{Text("year").foregroundColor(.blue).font(.title2).padding()
                    Text(filmDetayViewModel.filmDetayi?.year ?? "film detayi gösterilcek")
                }.padding()
            HStack{Text("Plot").foregroundColor(.blue).font(.title2).padding()
                Text(filmDetayViewModel.filmDetayi?.plot ?? "film detayi gösterilcek")
            }.padding()
            HStack{Text("Actors").foregroundColor(.blue).font(.title2).padding()
                Text(filmDetayViewModel.filmDetayi?.actors ?? "film detayi gösterilcek")
            }.padding()
            
            HStack{Text("Director").foregroundColor(.blue).font(.title2).padding()
                Text(filmDetayViewModel.filmDetayi?.director ?? "film detayi gösterilcek")
            }.padding()
                HStack{Text("İmdb Rating").foregroundColor(.blue).font(.title2).padding()
                    Text(filmDetayViewModel.filmDetayi?.imdbRating ?? "film detayi gösterilcek")
                }.padding()
            
        
            
        }.onAppear(perform: {self.filmDetayViewModel.filmDetayiGetir(imdbId: imdbId)}
        )
        
    }
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "deneme")
    }
}
