//
//  WelcomeView.swift
//  NTK
//
//  Created by Torgeir Eikeland on 16/03/2022.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var showModel = false
    
    var body: some View {
        ZStack(){
            Image("SplashLarge")
                .resizable()
                .ignoresSafeArea()
            

            VStack(spacing: 165){
                VStack(){
                    Text("Velkommen til")
                        .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.large)))
                        .foregroundColor(Color.white)
                    
                    Text("Nasjonal\ntjenestekatalog")
                        .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.lTitle)))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                }
                

                VStack(spacing: 65){
                    NavigationLink( destination: LoginView(), label: {
                        Text("Logg inn")
                            .frame(width: 126, height: 46)
                            .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.xLarge)))
                            .foregroundColor(.black)
                            .background(
                                Color((Consts.Color.digitalGreen))
                                    .cornerRadius(8)
                            )
                        
                    })
                    NavigationLink( destination: CreateAccountView()) {
                        Text("Registrer deg")
                            .frame(width: 181, height: 46)
                            .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.xLarge)))
                            .foregroundColor(.black)
                            .background(
                                Color((Consts.Color.digitalGreen))
                                    .cornerRadius(8)
                            )
                    }
                   Rectangle()
                        .frame(width: 10, height: 160)
                        .opacity(0)
                }
            }
        }.navigationBarHidden(true)
    }
}

//struct WelcomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView()
//    }
//}
