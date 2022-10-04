//
//  SharedRdf.swift
//  NTK
//
//  Created by Torgeir Eikeland on 04/04/2022.
//

import Foundation

@MainActor
class SharedRdf: ObservableObject {
    let rdfParse: RdfParsing = RdfParsing()
    @Published var all: [Graph] = []
    @Published var filteredToMC: [Graph] = []
    @Published var structure: [Graph] = []
    
    init(){
        rdfParse.getList { result in
            if let resultList = result {
                self.all = resultList
            }
        }
    }
    
    func getStructure(graph: Graph) -> [Graph]{
        switch graph.narrower {
        case .stringArray(let values):
            for sc in values {
                
                print(sc)
                for service in all {
                    if service.id == sc {
                        print("found it")
                        structure.append(service)
                    }
                }
            }
            return structure
        case .none:
            print("Hello")
        case .some(.string(_)):
            print("Helo")
        }
        return []
    }
    
    func getSubCategories(selectedService: Graph) -> [Graph]{
        var resultList: [Graph] = []
        
        switch selectedService.narrower {
        case .stringArray(let strings):
            for string in strings {
                for service in all {
                    if service.id == string {
                        resultList.append(service)
                        break
                    }
                }
            }
        case .string(let string):
            for service in all {
                if service.id == string {
                    resultList.append(service)
                    break
                }
            }
        default: print("Shared rdf failed")
        }
        return resultList
    }
    
    func getSearchCategories(searchId: [EmneordRef]) -> String{
        var categories: String = ""
        for emneord in searchId {
            for category in all {
                if emneord.psi == category.id {
                    if emneord == searchId[searchId.count - 1] {
                        categories.append(category.localizedPrefLabel(Utils.currentLanguageCode)?.value ?? "")
                        break
                    } else {
                        categories.append(category.localizedPrefLabel(Utils.currentLanguageCode)?.value  ?? "")
                        categories.append(" | ")
                        break
                    }
                }
            }
        }
        return categories
    }
    
    
    // Simple filter for faster load time for main categories
    func getMainCategories() -> [Graph]{
        return all.filter{ $0.topConceptOf != nil}
    }
}
