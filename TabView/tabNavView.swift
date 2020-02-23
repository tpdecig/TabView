//
//  ContentView.swift
//  TabView
//
//  Created by vincent Berry on 23/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

import SwiftUI
//import Combine

// C'est la version qui fonctionne quand on met tout dans la meme struct

struct TabNavView: View {

    @State var selectedView = 2 // on debute l'affichage avec celui qui permet de changer de tab progammatiquement
    //@State var modelNum = Model(num: 0,snum: "0")
    @State var snumToGo : String = "1"
    
    var body: some View {
        TabView(selection: $selectedView) {
            // 1er onglet
            Text("Onglet 4")
                .tag(4) // en general par de 0, mais on peut les ordonner dans l'ordre qu'on veut
                        // et même ne pas mettre tous les numéros
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("4")
            }
            
            //deuxiemeOnglet(nav: self.selectedView)
            VStack {
                    Text("Deuxième onglet (pour navigation)")
                Form {
                    //TextField("Aller à", text: $modelNum.snum)
                    TextField("Indiquez un tab", text: $snumToGo)
                    Button(action: {
                        print("bouton pour aller en \(self.snumToGo)")
                        self.selectedView = Int(self.snumToGo) ?? 2 // reste en 2 si soucis de trad°
                        // de façon assez interessante si on entre un num qui ne correspond à aucun tag, il va dans le 1er onglet du TabView plutôt que de renvoyer une erreur
                            }) {
                            Text("aller à ce tab")
                            }
                }
            }
              .tag(2)
              .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("2")
               }
            
            Text("Onglet 3")
                .tag(3) // numéro 0 dans la navigation % selectedView
                .tabItem {
                    Image(systemName: "circle")
                    Text("3")
            }
            Text("Onglet 1")
                .tag(1) // numéro 0 dans la navigation % selectedView
                .tabItem {
                    Image(systemName: "square")
                    Text("1")
            }
        }
    }
}
    

//struct deuxiemeOnglet : View {
//    @ObservedObject var nav : Int
//    var body: some View {
//        VStack {
//            Text("Second")
//            Button(action: {
//                print("bouton")
//
//            }) {
//            Text("chge tab")
//            }
//        }
//    }
//}


struct TabNavView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavView()
    }
}
