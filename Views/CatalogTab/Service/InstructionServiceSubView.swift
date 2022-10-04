//
//  two.swift
//  NTK
//
//  Created by Torgeir Eikeland on 23/03/2022.
//

import Foundation
import SwiftUI

struct InstructionServiceSubView: View {
    let service: Tjenestebeskrivelse
    @State private var webViewHeight: CGFloat = .zero
    
    var body: some View {
        
        if service.soknadKlage != "" {
            Text("Klage")
                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                .padding(.bottom, 8)
            HtmlViewWorking(htmlContent: service.soknadKlage)
        }
        
        if service.lover != "" {
            Text("Lover")
                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                .padding(.bottom, 8)
            HtmlViewWorking(htmlContent: service.lover)
        }
        
        if service.soknadSkjema != "" && service.soknadSkjema != "<br />\r\n" {
            Text("Søk her")
                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                .padding(.bottom, 8)
            HtmlViewWorking(htmlContent: service.soknadSkjema)
        }
        
        if service.soknadFrist != "" {
            Text("Søknadsfrist")
                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                .padding(.bottom, 8)
            HtmlViewWorking(htmlContent: service.soknadFrist)
        }
    }
}
