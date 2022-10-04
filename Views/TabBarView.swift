//
//  ContentView.swift
//  NTK
//
//  Created by Joey Chau on 28/02/2022.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var rdf: SharedRdf = SharedRdf()
    @StateObject var api: SearchViewModel = SearchViewModel()
    @State var selectedItem: Int = 0
    @FocusState var searchFocused: Bool
    @State var searchText: String = ""
    
    var body: some View {
        
        VStack{
            
            TabView(selection: $selectedItem) {
                NavigationView{
                    HomeView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Image(Consts.Icons.homeIcon)
                        .renderingMode(.template)
                    Text("Hjem")
                }.tag(0)
                NavigationView{
                    CatalogView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    if selectedItem == 1 {
                        Image(Consts.Icons.catalogIcon)
                            .renderingMode(.original)
                    } else {
                        Image(Consts.Icons.whiteCatalogIcon)
                            .renderingMode(.template)
                    }
                    Text("Katalog")
                }.tag(1)
                NavigationView{
                    SearchView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Image(Consts.Icons.favoritesIcon)
                        .renderingMode(.template)
                    Text("Favoritter")
                }.tag(2)
                NavigationView{
                    SettingsView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Image(Consts.Icons.settingsIcon)
                        .renderingMode(.template)
                    Text("Innstillinger")
                }.tag(3)
            }
            .accentColor(Color(Consts.Color.digitalGreen))
            .environmentObject(api)
            .environmentObject(rdf)
            
            
        }
    }
}

/*
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
*/
