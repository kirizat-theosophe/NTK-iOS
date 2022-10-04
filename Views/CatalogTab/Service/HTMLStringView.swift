//
//  HTMLStringView.swift
//  NTK
//
//  Created by Stine Marie Vørner on 05/04/2022.
//

import Foundation
import SwiftUI
import WebKit

struct HTMLStringView: UIViewRepresentable {
    @Binding var dynamicHeight: CGFloat
    //@Binding var dynamicHeight2: CGFloat
    let htmlContent: String
    var webView: WKWebView = WKWebView()
    var id: String
    
    class Coordinator: NSObject, WKNavigationDelegate{
        var parent: HTMLStringView
        
        init(_ parent: HTMLStringView){
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
            webView.evaluateJavaScript("document.body.scrollHeight", completionHandler: {(height, error) in
                DispatchQueue.main.async {
                    self.parent.dynamicHeight = height as! CGFloat
                    //self.parent.dynamicHeight2 = height as! CGFloat
                    print(self.parent.dynamicHeight)
                    //self.parent.frame(height: height as! CGFloat)
                }
            })
        }
    }
    
//    @objc func reload(_ sender: UIRefreshControl){
//        DispatchQueue.main.async {
//
//            webView.reload()
//            sender.endRefreshing()
//        }
//    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<HTMLStringView>) -> WKWebView {
        let htmlHead = "<!doctype html><meta charset=\"utf-8\"/><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\"><html><head><style>body{margin:0;font-size: 16;background-color: #e5e5e5;}.container{}.element{font-family:\"GimbalGrot-Reg\";font-size:16px;}</style></head>"
        let htmlBody = "<body><div class=\"container\"style=\"font-family:-apple-system,GimbalGrot-Reg,sans-serif\">\(htmlContent)</div>"
        let htmlEnd = "</body></html>"
        let htmlString = "\(htmlHead)\(htmlBody)\(htmlEnd)"
        
//        let refreshControl = UIRefreshControl()
//
//        refreshControl.addTarget(self, action: #selector(reload(_:)), for: UIControl.Event.valueChanged)
//
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        webView.navigationDelegate = context.coordinator
        webView.loadHTMLString(htmlString, baseURL: nil)
        webView.backgroundColor = UIColor(Color(Consts.Color.chillyGrey))
        //webView.font = UIFont(name: (Consts.Font.gimbalRegular), size: CGFloat(Consts.textSize.small as CGFloat))
        //webView.setFont(UIFont(name:(Consts.Font.gimbalRegular), size: CGFloat(Consts.textSize.small)))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<HTMLStringView>) {
       }
}

