//
//  CatalogView.swift
//  NTK
//
//  Created by Joey Chau on 02/03/2022.
//

import SwiftUI

struct CatalogView: View {
    @ObservedObject var viewModel = CatalogViewModel()
    @EnvironmentObject var rdf: SharedRdf
    @State var searchActive: Bool = false

    
    // Not working but would be better if it did :( -> same on other views...
    //@State var isActive: Bool =  false
    //@State var selectedService: Graph?

    
    
    var body: some View {
        ZStack{
            Color(Consts.Color.chillyGrey)
                .ignoresSafeArea()
            
            // Not working but would be better if it did :( -> same on other views...
          /*  NavigationLink(isActive: $isActive) {
                if let selectedService = selectedService {
                    SubCategoryView(graph: selectedService)
                }
            } label: {}*/
            
            NavigationLink(isActive: $searchActive) {
                SearchView()
            } label: {}
            
            ScrollView {
                LazyVStack{
                    ForEach(rdf.getMainCategories()) { thisGraph in
                        
                        NavigationLink {
                            SubCategoryView(graph: thisGraph)
                        } label: {
                            CategoryView(graph: thisGraph, categories: rdf.getSubCategories(selectedService: thisGraph))
                        }

                        // Not working but would be better if it did :( -> same on other views...
                       /*
                        Button {
                            selectedService = thisGraph
                            isActive = true
                        } label: {
                            CategoryView(graph: thisGraph, categories: rdf.getSubCategories(selectedService: thisGraph))
                        }
                        */
                    }
                    
                }
                .padding(.top)
                Spacer()
                
            }
        }.navigationTitle("Nasjonal tjenestekatalog")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        searchActive = true
                    } label: {
                        Image(Consts.Icons.searchIcon)
                            .renderingMode(.template)
                            .foregroundColor(Color(Consts.Color.whiteColor))
                    }
                }
                

            }
        
        
    }
}

//lag mappe i shared putt inn. (bruker language fra sharedPref, hvis ikke så brukes nb som en fallback. Husk  bruk kSelectedLanguage som key for Localization)
struct Utils {
    
    static var currentLanguageCode: String {
        return UserDefaults.standard.string(forKey: kSelectedLanguage) ?? Locale.preferredLanguages.first?.prefix(2).description ?? Language.nb.rawValue
    }
    
}
