//
//  Consts.swift
//  NTK
//
//  Created by Stine Marie Vørner on 01/03/2022.
//

import Foundation
import SwiftUI

let kSelectedLanguage: String = "selectedLanguage"

struct Consts {
    
    struct Color {
        static let authoritarianBlue = "AuthoritarianBlue"
        static let backgroundColor = "BackgroundColor"
        static let digitalGreen = "DigitalGreen"
        static let primaryTextColor = "PrimaryTextColor"
        static let warmOrange = "WarmOrange"
        static let whiteColor = "WhiteColor"
        static let chillyGrey = "ChillyGrey"
        static let freshRed = "FreshRed"
    }
    
    struct Font {
        //GimbalGrotesque
        static let gimbalBold = "GimbalGrot-Bol"
        static let gimbalBoldItalic = "GimbalGrot-BolItal"
        static let gimbalBookItalic = "GimbalGrot-BooItal"
        static let gimbalBook = "GimbalGrot-Boo"
        static let gimbalHeavy = "GimbalGrot-Hea"
        static let gimbalHeavyItalic = "GimbalGrot-HeaItal"
        static let gimbalItalic = "GimbalGrot-Ital"
        static let gimbalLightItalic = "GimbalGrot-LigItal"
        static let gimbalMedium = "GimbalGrot-Med"
        static let gimbalMediumItalic = "GimbalGrot-MedItal"
        static let gimbalRegular = "GimbalGrot-Reg"
        static let gimbalLight = "GimbalGrot-Lig"

    }
    
    struct Icons {
        static let catalogIcon = "CatalogIcon"
        static let whiteCatalogIcon = "WhiteCatalogIcon"
        static let favoritesIcon = "FavoritesIcon"
        static let settingsIcon = "SettingsIcon"
        static let arrowLeftIcon = "ArrowLeftIcon"
        static let arLeftIcon = "LeftIcon"
        static let openInNewIcon = "OpenInNewIcon"
        static let searchIcon = "SearchIcon"
        static let homeIcon = "HomeIcon"
    }
    
    
    struct textSize {
        static let xSmall = 14
        static let small = 16
        static let medium = 18
        static let large = 20
        static let xLarge = 24
        static let sTitle = 28
        static let lTitle = 32
        
    }
        
    /*
    Tekststørrelser i NTK app:

    Tekststørrelse 24:
        Bold: Overskrift på loginside

    Tekststørrelse 20:
        Bold: Overskrifter i tjenestebeskrivelser
        Medium: Overskrift generelt

    Tekststørrelse 18:
        Bold: Knapper
        Regular: Ingress i tjenestebeskrivelse

    Tekststørrelse 16:
        Bold: Den delen av tekst som søk treffer
        Regular: Generell brødtekst
        Book: Den delen av tekst som søk *ikke* treffer

    Tekststørrelse 14:
        Bold: Den delen av tekst som søk treffer
        Regular: Alt av undertekster, både søk og underkategorier, blant andre
    */
    
}
