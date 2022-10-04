//
//  RdfParsing.swift
//  NTK
//
//  Created by Stine Marie Vørner on 16/03/2022.
//

import Foundation

class RdfParsing {
    //If you press Graph with name: "", return all Graph with broader name: ""
    //If you can pass the id or index from maincategories into the nest view you have solved it
    
    //Decodes jsonLD from local all.jsonld file
    //sets jsonAll(data from all.jsjonld to be @Published var arrays at the top of this struct
    func getList(callback: @escaping ([Graph]?) -> Void){
        if let url = Bundle.main.path(forResource: "rdfJson", ofType: "jsonld"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: url)){
            let decoder = JSONDecoder()
            if let jsonAll = try? decoder.decode(RDFData.self, from: data){
                callback(jsonAll.graph)
                print("RDF PARSED")
                return
            }
        }
    }
}
