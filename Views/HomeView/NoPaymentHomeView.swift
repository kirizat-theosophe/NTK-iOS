//
//  NoPaymentHomeView.swift
//  NTK
//
//  Created by Bruker on 28/03/2022.
//

import SwiftUI

struct NoPaymentHomeView: View {
    var body: some View {
        ZStack{
            Color(Consts.Color.chillyGrey)
                .ignoresSafeArea(.all)
            VStack{
                Spacer().frame(width: 0, height: 0).padding(.bottom)
                VStack(alignment: .center){
                    Text("Velkommen til Nasjonal\nTjenestekatalog!")
                        .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                        .multilineTextAlignment(.center)
                    HStack{Spacer().frame(height: 0)}
                    
                    VStack{

                    Text("I denne katalogen finner du alle tjenester kommuner\nyter overfor sine innbyggere.")
                        .multilineTextAlignment(.leading)
                        //.padding(.horizontal)
                        .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.xSmall)))
                    }.padding(.horizontal, -20)
                        
                    
                }
             .padding()
                    //.multilineTextAlignment(.leading)
                    .background(Color.white)
                    .cornerRadius(10)
            
          
                VStack(alignment: .leading){
                    //Spacer().frame(width: 0, height: 0).padding(.bottom).padding(.top)
                        Text("Denne kontoen har ingen på gående abonnement.")
                            .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.xSmall)))
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .padding(.top)
                        Text("Før du kan ta i bruk appen må du sette opp et abonnement.")
                            .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.xSmall)))
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                    HStack{
                        Spacer()
                        Text("Si opp abonnement")
                            .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                            .padding()// Fix padding later
                            .foregroundColor(.black)
                            .background(Color((Consts.Color.digitalGreen)).cornerRadius(10).shadow(radius: 5))
                            
                        Spacer()
                          //  .clipShape(RoundedRectangle(cornerRadius: 20))
                    }.padding()
                        
                    
                    }
                     .background(Color.white)
                     .cornerRadius(10)
                
                 Spacer()
            }
            .padding(.horizontal)
            

        }
                    .navigationTitle("Nasjonal tjenestekatalog")
    }
    
}

struct NoPaymentHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NoPaymentHomeView()
    }
}
