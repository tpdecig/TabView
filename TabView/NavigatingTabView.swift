//
//  NavigatingTab.swift
//  TabView
//
//  Created by vincent Berry on 23/02/2020.
//  Copyright © 2020 vincent Berry. All rights reserved.
//

// Définit un onlget qui permet de naviguer programmatiquement
// vers des onglets différents d'un même TabView (dans lequel est inclus cet onglet)

import SwiftUI
import Combine

///////////////////////

struct NavigatingTabView : View {
    @ObservedObject var selectedMainTab : OngetCourant // nécessité de passer par une classe
    @State var snumToGo : String = "1" // var de cette vue et ses sous-vues (le TextField)
    
    var body: some View {
        VStack {
            Text("Deuxième onglet (pour navigation)")
            Form {
                //TextField("Aller à", text: $modelNum.snum)
                TextField("Indiquez un tab", text: $snumToGo)
                Button(action: {
                    print("bouton pour aller en \(self.snumToGo)")
                    self.selectedMainTab.tab = Int(self.snumToGo) ?? 2 // reste en 2 si soucis de trad°
                    // de façon assez interessante si on entre un num qui ne correspond à aucun tag, il va dans le 1er onglet du TabView plutôt que de renvoyer une erreur
                }) {
                    Text("aller à ce tab")
                }
            }
        }
    }
}
