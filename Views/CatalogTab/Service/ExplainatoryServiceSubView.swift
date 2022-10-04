//
//  one.swift
//  NTK
//
//  Created by Torgeir Eikeland on 23/03/2022.
//

import Foundation
import SwiftUI

struct ExplanatoryServiceSubView: View {
    let service: Tjenestebeskrivelse
    @State private var webViewHeight: CGFloat = .zero
    
    
    var body: some View {
        
        if service.malgruppe != "" {
            
            Text("Hvem passer tjenesten for")
                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                .padding(.bottom, 8)
                .padding(.top, 16)
            HtmlViewWorking(htmlContent: service.malgruppe)
        }
        
        if service.pris != "" && service.pris != "<br />\r\n" {
            
            Text("Pris")
                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                .padding(.bottom, 8)
                .padding(.top, 16)
            HtmlViewWorking(htmlContent: service.pris)
        }
        
        
        if service.kriterier != ""  {
            
            Text("Kriterier")
                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                .padding(.bottom, 8)
                .padding(.top, 16)
            HtmlViewWorking(htmlContent: service.kriterier)
        }
        
        if service.soknadVeiledning != "" {
            
            Text("Slik går du frem")
                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                .padding(.bottom, 8)
                .padding(.top, 16)
            HtmlViewWorking(htmlContent: service.soknadVeiledning)
        }
        
        if service.soknadBehandling != "" {
            Text("Behandling av saken din")
                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                .padding(.bottom, 8)
                .padding(.top, 16)
            HtmlViewWorking(htmlContent: service.soknadBehandling)
        }
        
        if service.soknadBehandlingstid != "" {
            Text("Saksbehandlingstid")
                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                .padding(.bottom, 8)
                .padding(.top, 16)
            HtmlViewWorking(htmlContent: service.soknadBehandlingstid)
        }
    }
}
