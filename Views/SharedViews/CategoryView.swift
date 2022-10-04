//
//  CategoryView.swift
//  NTK
//
//  Created by Torgeir Eikeland on 01/03/2022.
//

import SwiftUI

struct CategoryView: View {
    var graph: Graph? = nil
    var categories: [Graph]? = nil
    var serviceList: [Tjenestebeskrivelse]? = nil
    var service: String? = nil
    var favoriteIconShowing: Bool? = nil
    @State var filledHeart = false
    var body: some View {
        VStack(spacing: 0){
            HStack{
                VStack(alignment: .leading){
                    
                    // Shows the name of category
                    if let graph = graph {
                        Text(graph.localizedPrefLabel(Utils.currentLanguageCode)?.value ?? "No title :(")
                            .foregroundColor(Color(Consts.Color.authoritarianBlue))
                            .font(Font.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.medium)))
                            .multilineTextAlignment(.leading)
                    }
                    
                    // Shows the options that will show if category is clicked
                    if let categories = categories {
                        Text(newModel().printCategories(graphList: categories))
                            .foregroundColor(Color(Consts.Color.authoritarianBlue))
                            .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.xSmall)))
                            .multilineTextAlignment(.leading)
                    }
                    
                    // Shows the services connected to the Title
                    if let serviceList = serviceList {
                        Text(newModel().getServiceNames(serviceList: serviceList))
                            .foregroundColor(Color(Consts.Color.authoritarianBlue))
                            .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.xSmall)))
                            .multilineTextAlignment(.leading)
                        
                    }
                    
                    // Shows name of service that leads to service vie
                    if let service = service {
                        Text(service)
                            .foregroundColor(Color(Consts.Color.authoritarianBlue))
                            .font(Font.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                            .multilineTextAlignment(.leading)
                    }
                    
                }
                Spacer()
                if favoriteIconShowing != nil && favoriteIconShowing == true {
                    Button {
                        filledHeart.toggle()
                    } label: {
                        if filledHeart {
                            Image("FavoriteFilled") // TODO: add to consts
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16)
                                .foregroundColor(Color.red) // TODO: add consts color to this!
                        } else {
                            Image(Consts.Icons.favoritesIcon)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16)
                                .foregroundColor(Color.red)//TODO: add consts color to this!
                        }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                } else {
                    Image(Consts.Icons.arrowLeftIcon)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 13)
                        .foregroundColor(Color(Consts.Color.digitalGreen))
                        .padding(.horizontal)
                }
                
            }
            .padding(.leading)
            .padding(.vertical, 8.0)
            .background(Color.white)
            Rectangle()
                .fill(Color(Consts.Color.digitalGreen))
                .frame(height: 2)
        }
        .cornerRadius(4)
        .shadow(radius: 4)
        .padding(.horizontal)
    }
}

struct newModel {
    func printCategories(graphList: [Graph]) -> String{
        var resultString = ""
        for element in graphList {
            if graphList[(graphList.count - 1)].id != element.id {
                resultString.append("\(element.localizedPrefLabel(Utils.currentLanguageCode)?.value ?? "No title :("), ")
            } else {
                resultString.append(element.localizedPrefLabel(Utils.currentLanguageCode)?.value ?? "No title :(")
            }
        }
        return resultString
    }
    
    func getServiceNames(serviceList: [Tjenestebeskrivelse]) -> String{
        var resultString = ""
        
        for service in serviceList {
            if serviceList[(serviceList.count - 1)].navn != service.navn {
                resultString.append(service.navn + ", ")
            } else {
                resultString.append(service.navn)
            }
        }
        return resultString
    }
}
