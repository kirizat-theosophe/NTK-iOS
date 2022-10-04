//
//  SearchItem.swift
//  NTK
//
//  Created by Torgeir Eikeland on 23/03/2022.
//

import Foundation
import SwiftUI

struct SearchItem: View{
    let name: String
    let categories: String
    var body: some View {
        HStack{
            Image(Consts.Icons.searchIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .padding(.trailing)
            VStack(alignment: .leading){
                Text(name)
                    .font(.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.small)))
                Text(categories)
                    .font(.custom(Consts.Font.gimbalRegular, size: CGFloat(Consts.textSize.xSmall)))
            }
            
        }
    }
    
}
