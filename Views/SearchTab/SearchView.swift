//
//  FavoritesView.swift
//  NTK
//
//  Created by Joey Chau on 02/03/2022.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var api: SearchViewModel
    @EnvironmentObject var rdf: SharedRdf
    // Makes custom back button possible
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedService: Tjenestebeskrivelse?
    @FocusState var searchFocused: Bool
    @State var searchFieldText: String = ""
    @State var serviceViewActive: Bool = false
    var body: some View {
        ZStack{
            Color(Consts.Color.chillyGrey)
                .edgesIgnoringSafeArea(.all)
            
            // Takes service from forEach and sends it to ServiceView
            NavigationLink(isActive: $serviceViewActive) {
                if let selectedService = selectedService {
                    ServiceView(service: selectedService)
                }
            } label: {
            }
            
            // Showing list of service´s after minimum 3 characters have been typed
            // On tap it sends service to navigationLink and takes you to service view
            VStack{
                ScrollView{
                    if searchFieldText.count > 1 {
                        LazyVStack(alignment: .leading, spacing: 0){
                            ForEach(api.searchFilter(input: searchFieldText), id: \.self) { service in
                                SearchItem(name: service.navn, categories: rdf.getSearchCategories(searchId: service.emneordRefs))
                                    .padding(.top)
                                    .onTapGesture {
                                        selectedService = service
                                        serviceViewActive = true
                                    }
                            }
                        }
                    } else {
                        VStack(alignment: .center){
                            // if there is no text in searchField then we show this
                            Text("Skriv i søkefeltet hva du leter etter. \nNylige søk vil komme opp her etter du har skrevet de inn.")
                                .font(.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                    }
                }                
            }
            .padding(.horizontal)
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(Consts.Icons.arrowLeftIcon)
                        .resizable()
                        .renderingMode(.template)
                        .rotationEffect(.degrees(180))
                        .scaledToFit()
                        .frame(width: 13, height: 15)
                        .foregroundColor(Color(Consts.Color.warmOrange))
                }
            }
            
            ToolbarItem(placement: .principal) {
                HStack{
                    HStack{
                        Image(Consts.Icons.searchIcon)
                        TextField("Søk her", text: $searchFieldText)
                            .font(.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                            .focused($searchFocused)
                    }
                    .onTapGesture {
                        searchFocused =  true
                    }
                    Image(systemName: "xmark")
                        .foregroundColor(Color(Consts.Color.primaryTextColor))
                        .font(.system(size: 10))
                        .onTapGesture {
                            searchFieldText = ""
                        }
                }
                .padding(5)
                .background(Color.white)
                .cornerRadius(5)
            }
        }
    }
}

/*
 struct FavoritesView_Previews: PreviewProvider {
 static var previews: some View {
 SearchView()
 }
 }
 */
