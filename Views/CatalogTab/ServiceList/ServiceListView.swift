//
//  ServiceListView.swift
//  NTK
//
//  Created by Joey Chau on 09/03/2022.
//

import SwiftUI

struct ServiceListView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = ServiceListViewModel()
    @EnvironmentObject var api: SearchViewModel
    @EnvironmentObject var rdf: SharedRdf
    let graph: Graph
    @State var searchActive: Bool =  false
    
    //let tb: Tjenestebeskrivelse
    
    
    //let serviceNavn: String
    //let subCategories: String
    var body: some View {
        ZStack{
            Color(Consts.Color.chillyGrey)
                .edgesIgnoringSafeArea(.all)
            NavigationLink(isActive: $searchActive) {
                SearchView()
            } label: {}
            
            ScrollView{
                LazyVStack(alignment: .leading){

                    ForEach(rdf.getSubCategories(selectedService: graph)){ thisGraph in
                        if api.getServiceList(graph: thisGraph) != [] {
                            NavigationLink {
                                ServiceListList(graph: thisGraph)
                            } label: {
                                CategoryView(graph: thisGraph, serviceList: api.getServiceList(graph: thisGraph))

                            }
                        }
                    }
                }
                .padding(.top)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(graph.localizedPrefLabel(Utils.currentLanguageCode)?.value ?? "no name")
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
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(Consts.Icons.arrowLeftIcon)
                        .resizable()
                        .renderingMode(.template)
                        .rotationEffect(.degrees(180))
                        .scaledToFit()
                        .frame(width: 9, height: 12)
                        .foregroundColor(Color(Consts.Color.warmOrange))
                    Text("Tilbake")
                        .foregroundColor(Color(Consts.Color.whiteColor))
                }
            }
        }
    }
    
    
}


/*
 struct ServiceListView_Previews: PreviewProvider {
 static var previews: some View {
 //ServiceListView()
 }
 }
 }*/
