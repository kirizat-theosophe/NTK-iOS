//
//  NTKApp.swift
//  NTK
//
//  Created by Joey Chau on 28/02/2022.
//

import SwiftUI
import Firebase

@main
struct NTKApp: App {

    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    
    init() {
        
        //Changes tabview backGround color
        UITabBar.appearance().backgroundColor = UIColor(named: Consts.Color.authoritarianBlue)
        
        //Changes unselectedicon color
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: Consts.Color.chillyGrey)
        
        // Changes default navigationBarColor and onScroll Color
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: Consts.Color.chillyGrey) ?? Color.white]
        appearance.backgroundColor = UIColor(Color(Consts.Color.authoritarianBlue))
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UITabBar.appearance().barTintColor = UIColor(named: Consts.Color.authoritarianBlue)
                
    }

    var body: some Scene {
        WindowGroup {
            LoginNavigation()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            //Firebase Initializer
            FirebaseApp.configure()
            return true
        }
    }
}
