//
//  SignInView.swift
//  NTK
//
//  Created by Bruker on 22/03/2022.
//

import SwiftUI

struct SignInView: View {
   

    
    //@State var offset: CGSize = .zero
    @State private var showLoggModal = false

    
    //@State private var showModel = false
    
    var body: some View {
        ZStack (){
            Image("SplashLarge")
                .resizable()
                .ignoresSafeArea()
            ModalGetAccountView(isShowing: $showLoggModal)
            
            VStack{
                
                Button(action: {}) {
                    Text("Nasjonal \n Tjenestekatalog")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    
                }.offset(y: -15)
                
                
                Spacer()
                if showLoggModal == false{
                    HStack{
                        Text("Logg Inn")
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color("DigitalGreen").cornerRadius(10).shadow(radius: 10))
                        
                        
                        Spacer()
                        
                        Text("Registrer deg")
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color("DigitalGreen").cornerRadius(10).shadow(radius: 10))
                    }.offset(y: -35)
                    
                    VStack {
                        Button(action: {showLoggModal = true }) {
                            Text("Skaff tilgang")
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding()
                                .padding(.horizontal)
                                .background(Color("DigitalGreen").cornerRadius(10).shadow(radius: 10))
                        }
                        
                    }.offset(y: -15)
                }
                
            }
            
        }
    }
}

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}
