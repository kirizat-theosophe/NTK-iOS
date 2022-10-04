//
//  SubCategoryViewModel.swift
//  NTK
//
//  Created by Torgeir Eikeland on 02/03/2022.
//

import Foundation
import SwiftUI

class SubCategoryViewModel: ObservableObject{
    @Published var parsedList: [Graph] = []
    
/*
    func getNewList(selectedService: Graph, rdfList: [Graph]) -> [Graph]{
        var list: [Graph] = []
        
        switch selectedService.narrower {
        case .stringArray(let strings):
            for string in strings {
                for service in rdfList {
                    if service.id == string {
                        list.append(service)
                        break
                    }
                }
            }
        default: print("No case")
        }
        return list
        
    }*/
}
