//
//  ServiceListList.swift
//  NTK
//
//  Created by Torgeir Eikeland on 04/04/2022.
//

import Foundation
import SwiftUI

struct ServiceListList: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var api: SearchViewModel
    @State var searchActive: Bool =  false

    let graph: Graph
    
    var body: some View{
        ZStack {
            Color(Consts.Color.backgroundColor)
                .edgesIgnoringSafeArea(.all)
            NavigationLink(isActive: $searchActive) {
                SearchView()
            } label: {}
            
            ScrollView{
                LazyVStack(alignment: .leading) {
                    ForEach(api.getServiceList(graph: graph), id: \.self){ thisService in
                        NavigationLink {
                            ServiceView(service: thisService)
                        } label: {
                            CategoryView(service: thisService.navn, favoriteIconShowing: true)
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
