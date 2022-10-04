//
//  HomeView.swift
//  NTK
//
//  Created by Bruker on 28/03/2022.
//

import SwiftUI

struct HomeView: View {
    let homeside = homeSideList
    
    var body: some View {
        ZStack{
            //Color(Consts.Color.chillyGrey)
              //  .ignoresSafeArea()
            
            VStack(){
                HStack(){
                    
                    
                    Spacer()
                    HStack{
                        Image(systemName: "arrow.turn.right.up")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 30)
                            .padding(.top,-50)
                            //.foregroundColor(Color(Consts.Color.digitalGreen))
                    }
                    
                }.padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                
                
                VStack{
                    HStack{
                        Image(Consts.Icons.searchIcon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .padding(.trailing)
                        VStack(alignment: .leading){
                            Text("Søk i katalogen")
                                .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                                .padding(.horizontal, 50)
                                .frame(alignment: .center)
                            Text("Søk på tjenesten du leter etter")
                                .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Spacer()
                        HStack{
                            Image(Consts.Icons.arrowLeftIcon)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 13)
                                .foregroundColor(Color(Consts.Color.digitalGreen))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8.0)
                    .foregroundColor(.black)
                    .background(Color(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0))
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    Rectangle()
                        .fill(Color(Consts.Color.digitalGreen))
                        .frame(height: 2)
                    
                    
                }
                .padding(.horizontal)
                

                VStack{
                    Spacer()
                    HStack{
                        Text("Nylig viste tjenester ")
                            .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                            .frame(alignment: .leading)
                            .padding(.horizontal)
                        Spacer()

                        NavigationLink(destination: NoPaymentHomeView(), label:{
                            Text("Tøm listen")
                                .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                                .frame(alignment: .trailing)
                                .padding(.horizontal)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                            
                        )}.buttonStyle(.plain)
                    
                    
                    ScrollView{
                        VStack{
                            ForEach(homeside, id: \.self) { home in
                                NavigationLink(destination: Text(home)) {
                                    HStack {
                                        CategoryView(graph: nil, categories: nil, service: home)
                                    }
                                    //.foregroundColor(.black)
                                    //.background(Color(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0))
                                    
                                    
                                }
                            }
                        }
                        
                    }
                }
            }.navigationTitle("Nasjonal tjenestekatalog")
            Color(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0).opacity(0.5)
            
            VStack{
            VStack(alignment: .center){
            Text("Du finner også søk-knappen oppe i hjørnet på de fleste sider, så du enkelt har tilgang til søkefunksjonen")
                .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                
                .padding(.horizontal)
                .frame(alignment: .center)
                .padding(.top)
                .multilineTextAlignment(.leading)
            
            Text("Ok,gå til søk.")
                    .frame(width: 181, height: 46)
                    .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.xLarge)))
                    .foregroundColor(.black)
                    .background(
                        Color((Consts.Color.digitalGreen))
                            .cornerRadius(8)
                    )
                    .padding(.bottom,10)

            }
            .background(.white)
                Spacer()
            }
        }
        .foregroundColor(.black)
        .padding([.vertical], 4)
        .padding([.horizontal], 8)
        .background(Color(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0))
        .cornerRadius(4)
        .overlay(RoundedRectangle(cornerRadius: 4)
            .stroke(Color.black, lineWidth: 0.5)
        )
    }
}


let homeSideList = [
    "Fredete bygninger og anlegg – tillatelse til inngrep",
    "Bibliotek",
    "Barnehageplass",
    //"Barnehageplass",
    //"Barnehageplass",
    "Barnehageplass",
    "Allemannsretten",
    "Kommunal planlegging - medvirkning",
]


//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//        /*
//         Group {
//             // HomeView().previewDevice("iPhone 8")
//             //HomeView().previewDevice("iPhone 8 Plus")
//             HomeView().previewDevice("iPhone 11")
//             HomeView().previewDevice("iPhone 11 Pro")
//             //HomeView().previewDevice("iPhone 11 Pro Max")
//             HomeView().previewDevice("iPhone 12")
//             HomeView().previewDevice("iPhone 12 Pro")
//             //HomeView().previewDevice("iPhone 12 Pro Max")
//             //HomeView().previewDevice("iPhone 12 Pro mini")
//             HomeView().previewDevice("iPhone 13")
//             HomeView().previewDevice("iPhone 13 Pro")
//             HomeView().previewDevice("iPhone 13 Pro Max")
//             //HomeView().previewDevice("iPhone 13 Pro mini")
//         }
//
//         */
//    }
//}
