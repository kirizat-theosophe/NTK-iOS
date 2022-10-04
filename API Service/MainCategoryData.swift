//
//  MainCategoryData.swift
//  NTK
//
//  Created by Stine Marie Vørner on 02/03/2022.
//

import Foundation


struct MainCateGoryData: Codable{
    let mainCategory: [MainCategory]

}

struct MainCategory: Codable, Identifiable{
    var id = UUID()
 //   let title: [String: String]
    let title: String
    let subCategory: [SubCategory]
//    var isSubcategory: Bool{
//        return broader != nil
//    }
//    let broader: String?
//    let link: String 
    let mainCategoryClass: [MainCategoryClass]
}

struct SubCategory: Codable, Identifiable{
    var id = UUID()
    let title: String
    let serviceList: [ServiceList]
    let subCategoryClass: SubCategoryClass
}

struct ServiceList: Codable, Identifiable{
    var id = UUID()
    let title: String
    let service: [Service]
}

struct Service: Codable, Identifiable{
    let id: Int
    let navn: String
    let ingress: String
    let beskrivelse: String
    let malgruppe: String
    let pris: String
    let kriterier: String
    let lover: String
    let dokumentRefSet: [DataRef]
    let soknadVeiledning: String
}

struct DataRef: Codable, Identifiable{
    var id = UUID()
    let dokmentID: Int
    let tittel: String
    let uri: String
}

struct SubCategoryClass: Codable{
    let title: String
}

struct MainCategoryClass: Codable{
    let title: String
}

