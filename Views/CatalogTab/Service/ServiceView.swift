//
//  ServiceView.swift
//  NTK
//
//  Created by Torgeir Eikeland on 02/03/2022.
//

import Foundation
import SwiftUI
import WebKit


struct ServiceView: View {
    @ObservedObject var viewModel = ServiceViewModel()
    let service: Tjenestebeskrivelse
    @State private var webViewHeight: CGFloat = .zero
    //@State private var webViewHeight2: CGFloat = .zero
    //var webViewLoaded = false
    
    var body: some View {
        
        ZStack{
            Color(Consts.Color.backgroundColor)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                VStack(alignment: .leading){
                    
                    HtmlViewWorking(htmlContent: service.ingress)
                    
                    Text("Beskrivelse")
                        .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                    
                    HtmlViewWorking(htmlContent: service.beskrivelse)
                    
                    ExplanatoryServiceSubView(service: service)
                    
                    InstructionServiceSubView(service: service)
                    
                    VStack(alignment: .leading) {
                        if service.dokumentRef != [] {
                            
                            Text("Regelverk")
                                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                                .padding(.bottom, 8)
                            
                            
                            ForEach(service.dokumentRef ,id: \.self) { dokRef in
                                
                                if dokRef.dokumenttypeID == 1 || dokRef.dokumenttypeID == 2 {
                                    
                                    //Text(dokRef.tittel)
                                    HtmlViewWorking(htmlContent: dokRef.tittel)
                                    
                                }
                            }
                            
                        }
                    }.padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        if service.dokumentRef != [] {
                            
                            Text("Les mer")
                                .font(.custom(Consts.Font.gimbalBold, size: CGFloat(Consts.textSize.large)))
                                .padding(.bottom, 8)
                            
                            
                            ForEach(service.dokumentRef , id: \.self) { dokRef in
                                
                                if dokRef.dokumenttypeID == 5 || dokRef.dokumenttypeID == 7 {
                                    
                                    Text(dokRef.tittel)
                                    //dokRef.uri
                                    
                                }
                            }
                        }
                    }
                    
                    
                }
                .padding()
                .navigationTitle(service.navn)
            }
        }
        
    }
}

struct HtmlViewWorking: View {
    @State var webViewHeight: CGFloat = .zero
    @State var htmlContent: String
    var body: some View {
        VStack {
            HTMLStringView(dynamicHeight: $webViewHeight, htmlContent: "\(htmlContent)", id: htmlContent)
                .frame(minHeight: 0, idealHeight: webViewHeight + 20, maxHeight: .infinity, alignment: .leading)
        }
    }
}








//extension NSMutableAttributedString {
//    
//    let ingress = service.ingress
//    let attributedIngress = NSAttributedString(string: ingress)
//    let attrubutes = [NSAttributedString.Key.font: font]
//    let font = UIFont.systemFont(ofSize: Consts.textSize.small as! CGFloat)
//    
//    
//    public convenience init?(html: String, fontSize: String) {
//        guard let data = String(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: %2$@\">%1$@</span>", html, fontSize).data(using: String.Encoding.unicode, allowLossyConversion: false) else {
//            return nil
//        }
//        
//        guard let attributedString = try? NSAttributedString(data: data, options:
//            [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else {
//            return nil
//        }
//        
//        self.init(attributedString: attributedString)
//    }
//}
// 
 
 //lblDescription.attributedText = NSMutableAttributedString(html: text, fontSize: "16.0")






/*
 struct LoginView_Previews: PreviewProvider {
 static var previews: some View {
 ServiceView()
 }
 }
 */
