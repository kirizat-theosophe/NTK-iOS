//
//  SetupPaymentView.swift
//  NTK
//
//  Created by Bruker on 22/03/2022.
//

import SwiftUI

struct SetupPaymentView: View {

    var body: some View {
        ZStack(){
            Image("SplashLarge")
                .resizable()
                .ignoresSafeArea()
            
            VStack(alignment: .center){
                    Text("Nasjonal \nTjenestekatalog")
                        .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.sTitle)))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 50)
                    Spacer()
            }
            
            Spacer()
            
            VStack(){
                Text("Prøveperioden er utløpt.")
                    .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                    .padding(.horizontal, 10)
                    .frame(alignment: .center)
                    .offset(y: -10)
                Text("For å fortsette å kunne bruke tjenesten med denne kontoen må du betale for et abonnement.")
                    .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom)
                
                Spacer()
                
                VStack{
                    Text("Sett opp betaling")
                    //Capsule().frame(width: 40, height: 6)
                        .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                        .foregroundColor(.black)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 70)
                        .background(Color((Consts.Color.digitalGreen)).cornerRadius(10).shadow(radius: 10))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }.frame(height: 40)
                
               // Spacer()
                
                VStack{
                    NavigationLink(destination: WelcomeView(), label:{
                        Text("Gå tilbake til startsiden")
                            .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                            .foregroundColor(.black)
                            
                    }
                )}
                
                
            }.frame(height: 150)
                .padding(20)
                .foregroundStyle(.black)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke( Color(Consts.Color.digitalGreen))
                ).background(
                    RoundedRectangle(cornerRadius: 0, style: .continuous).fill(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                
        )}
        .navigationBarHidden(true)
    }
}

//struct SetupPaymentView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetupPaymentView()
//    }
//}

