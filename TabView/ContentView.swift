//
//  ContentView.swift
//  TabView
//
//  Created by vincent Berry on 23/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.


// Déclare un TabView contenant qq onglets, dont un de type NavigatingTab
// qui permet de déclencher par prog le changement d'onglet, donc l'UI

import SwiftUI
import Combine

// On doit créer une classe si on veut utiliser ObservedObject et changer ainsi une info d'une vue à une autre
class OngetCourant : ObservableObject {
    // this class will automatically send change announcements when tab property changes
     @Published var tab : Int // num de l'onglet qui est visualisé dans le TabView
     init(tab t: Int) {self.tab=t}
}

struct ContentView: View {
    // Important : @ObservedObject et pas juste le mettre en @State !!!
    // sinon ContentView (et donc son TabView n'est pas averti en cas de modif de cette propriété)
    @ObservedObject private var selectedView = OngetCourant(tab: 2) // on debute l'affichage avec celui qui permet de changer de tab progammatiquement
        
    var body: some View {
        TabView(selection: self.$selectedView.tab) {
            // 1er onglet à gauche
            Text("Onglet 4")
                // tag permet de repérer chaque onglet séparément
                .tag(4) // en general démarre de 0, mais on peut les ordonner dans l'ordre qu'on veut
                        // et même ne pas mettre tous les numéros
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("4")
            }
            NavigatingTabView(selectedMainTab: self.selectedView)
            //Text("Onglet 2")
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
            // dernier onglet à droite
            Text("Onglet 1")
                .tag(1) // numéro 1 dans la navigation % selectedView
                .tabItem {
                    Image(systemName: "square")
                    Text("1")
            }
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
