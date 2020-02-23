# TabView en SwiftUI
(23 fév 2020)

Navigation entre les onglets d'un TabView par programme :
- implémenté dans des vues séparées (l'onglet actuel est encapsulé dans une classe dont une instance est partagée entre vues par @ObservedObject du framework Combine)
- aussi dispo dans une même vue (qui n'utilise pas Combine du coup)
