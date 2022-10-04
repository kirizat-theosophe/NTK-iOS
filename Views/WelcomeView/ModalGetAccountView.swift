//
//  ModalGetAccountView.swift
//  NTK
//
//  Created by Bruker on 22/03/2022.
//

import SwiftUI

struct ModalGetAccountView: View {
    
    @Binding var isShowing: Bool
    @State private var isDragging = false
    @State private var curHeight: CGFloat = 400
    let minHeight: CGFloat = 400
    let maxHeight: CGFloat = 700
    let startOpacity: Double = 0.4
    let endOpacity: Double = 0.8
    
    var dragPercentage: Double{
        let res = Double((curHeight - minHeight) / (maxHeight - minHeight))
        return max(0, min(1, res))
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            if isShowing {
                Color.black
                    .opacity(startOpacity + (endOpacity - startOpacity) * dragPercentage)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                mainView
                    .transition(.move(edge: .bottom))
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .animation(.easeInOut)
    }
    
    var mainView: some View {
        VStack{
            ZStack{
                VStack{
                    Image(systemName: "chevron.up").frame(width: 20, height: 10)
                    
                    Text("Skaff tilgang")
                        .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.xLarge)))
                        .foregroundColor(.black)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 25)
                        .background(Color((Consts.Color.digitalGreen)).cornerRadius(10).shadow(radius: 10))
                }.frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.00001))// this is important for the dragging!
                    .gesture(dragGesture)
            }
            ZStack{
                VStack{
                    Text("Man kan også prøve tjenesten i {2 uker} før man må betale. Pris for tjenesten per måned er 5 poteter og ei høne.")
                        .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 10)
                    ZStack{
                        VStack{
                            Button(action: {}) {
                                Text("Start prøveperiode")
                                    .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                                    .foregroundColor(.black)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color((Consts.Color.digitalGreen)).cornerRadius(10).shadow(radius: 10))
                            }.frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.00001))// this is important for the dragging!
                                .gesture(dragGesture)
                        }
                    }
                    Text("Tilgang til katalogen er lagt under en abonnementsbetaling, hvor man betaler en liten sum for å få tilgang.")
                        .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 15)
                    ZStack{
                        VStack{
                            NavigationLink( destination: SetupPaymentView(), label: {
                                Text("Sett opp betaling")
                                    .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                                    .foregroundColor(.black)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color((Consts.Color.digitalGreen)).cornerRadius(10).shadow(radius: 10))
                            })
                        }
                    }
                }.padding(.horizontal, 30)
            }.frame(maxHeight: .infinity)
                .padding(.bottom, 35)
        }.frame(height: curHeight)
            .frame(maxWidth: .infinity)
            .background(
                //HACK for RoundedCorners only on top
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                    Rectangle()
                        .frame(height: curHeight / 2)
                }.foregroundColor(Color(Consts.Color.chillyGrey))
            )
            .animation(isDragging ? nil : .easeInOut(duration: 0.45))
    }
    
    @State private var prevDragTranslation = CGSize.zero
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if !isDragging {
                    isDragging = true
                }
                let dragAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxHeight || curHeight > minHeight {
                    curHeight -= dragAmount / 6
                }else {
                    curHeight -= dragAmount
                }
                //curHeight -= dragAmount
                
                prevDragTranslation = val.translation
                
            }
            .onEnded { val in
                prevDragTranslation = .zero
                isDragging = false
                if curHeight > maxHeight {
                    curHeight = maxHeight
                }
                else if curHeight < minHeight {
                    curHeight = minHeight
                }
            }
    }
}



//struct ModalGetAccountView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalGetAccountView()
//    }
//}
