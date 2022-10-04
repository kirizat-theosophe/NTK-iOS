//
//  SettingsView.swift
//  NTK
//
//  Created by Joey Chau on 02/03/2022.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var loggInState: LoggedInState
    @ObservedObject var viewModel = settingsViewModel()
    @State var isActive: Bool =  false
    @State var customAlert: Bool = false
    
    var body: some View {
        
        ZStack{
            
            NavigationLink(isActive: $isActive) {
                SearchView()
            } label: {
                
            }
            
            
            VStack(spacing: 10) {
                NavigationLink{
                    LanguagesView()
                } label: {
                    Text("Endre språk")
                        .font(Font.custom(Consts.Font.gimbalMedium, size: CGFloat(Consts.textSize.medium)))
                    Spacer()
                    Image(Consts.Icons.arrowLeftIcon)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 10, height: 13.33)
                        .foregroundColor(Color(Consts.Color.digitalGreen))
                }
                .buttonStyle(.plain)
                .padding(.top, 16.00)
                
                NavigationLink {
                    AboutView()
                }label: {
                    
                    Text("Om katalogen")
                        .font(Font.custom(Consts.Font.gimbalMedium, size: CGFloat(Consts.textSize.medium)))
                    Spacer()
                    Image(Consts.Icons.arrowLeftIcon)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 10, height: 13.33)
                        .foregroundColor(Color(Consts.Color.digitalGreen))
                    
                }
                .buttonStyle(.plain)
                
                Button{
                    //TODO: Navigate to subscriptions page
                }label: {
                    
                    Text("Abonnementsinformasjon")
                        .font(Font.custom(Consts.Font.gimbalMedium, size: CGFloat(Consts.textSize.medium)))
                    Spacer()
                    Image(Consts.Icons.arrowLeftIcon)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 10, height: 13.33)
                        .foregroundColor(Color(Consts.Color.digitalGreen))
                    
                }
                .buttonStyle(.plain)
                
                Button{
                    //TODO: Navigate to account settings page
                }label: {
                    
                    Text("Kontoinstillinger")
                        .font(Font.custom(Consts.Font.gimbalMedium, size: CGFloat(Consts.textSize.medium)))
                    Spacer()
                    Image(Consts.Icons.arrowLeftIcon)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 10, height: 13.33)
                        .foregroundColor(Color(Consts.Color.digitalGreen))
                }
                .buttonStyle(.plain)
                
                
                Divider()
                    .frame(height: 2)
                    .background(Color.black)
                
                
                VStack{
                    Button{
                        //TODO: Open External web browser
                    }label: {
                        Text("KFs nettsider")
                            .font(Font.custom(Consts.Font.gimbalMedium, size: CGFloat(Consts.textSize.medium)))
                        Image(Consts.Icons.openInNewIcon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 19, height: 23)
                        Spacer()
                    }
                    .buttonStyle(.plain)
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color.black)
                
                Button(action: {
                    customAlert.toggle()
                }) {
                    
                    Text("Tøm favoritter")
                    Spacer()
                }
                .buttonStyle(.plain)
                Spacer()
                VStack{
                    Spacer()
                    Divider()
                        .frame(height: 2)
                        .background(Color.black)
                    
                    Button {
                        
                        viewModel.signOut {
                            loggInState.isLoggedIn = false
                        }
                    }label: {
                        Text("Logg ut")
                            .font(Font.custom(Consts.Font.gimbalMedium, size: CGFloat(Consts.textSize.medium)))
                        Spacer()
                    }
                    .buttonStyle(.plain)
                    
                    Text("Versjonsnummer: 0.0.1")
                        .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.xSmall)))
                        .foregroundColor(Color(Consts.Color.authoritarianBlue))
                        .padding(.bottom, 16.00)
                        .padding(.top, 26)
                }
            }
            .padding(.horizontal, 16.0 )
            if customAlert{
                CustomAlertView(show: $customAlert)
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
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isActive = true
                } label: {
                    Image(Consts.Icons.searchIcon)
                        .renderingMode(.template)
                        .foregroundColor(Color(Consts.Color.whiteColor))
                }
            }
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}

struct CustomAlertView : View {
    
    @Binding var show : Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Color(Consts.Color.authoritarianBlue)
                .overlay(
                    Text("Tøm favoritter")
                        .foregroundColor(Color(Consts.Color.whiteColor))
                        .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.medium)))
                )
                .frame(height: 45.0)
            
            
            Text("Er du sikker på at du vil slette favorittene dine? Du kan legge til nye favoritter når som helst!.")
                .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
            HStack{
                Button(action: {
                    show.toggle()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.red.opacity(0.4))
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.red, lineWidth: 1.5)
                        Text("Nei")
                            .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.small)))
                            .foregroundColor(.black)
                            .shadow(radius: 10)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .frame(height: 40)
                }
                .padding([.vertical], 4)
                .padding([.horizontal], 8)
                .cornerRadius(4)
                
                Spacer()
                
                Button(action: {
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.green.opacity(0.4))
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.green.opacity(0.4))
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.green.opacity(0.9), lineWidth: 1.3)
                        Text("Ja")
                            .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.small)))
                            .foregroundColor(.black)
                            .shadow(radius: 10)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .frame(height: 40)
                }
                .padding([.vertical], 4)
                .padding([.horizontal], 8)
                .cornerRadius(4)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(width: 300)
        .background(Color(Consts.Color.backgroundColor))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
