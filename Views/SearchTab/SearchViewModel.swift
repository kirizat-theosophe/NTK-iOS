//
//  FavoritesViewModel.swift
//  NTK
//
//  Created by Torgeir Eikeland on 02/03/2022.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    let apiModel: APIParsing = APIParsing()
    @Published var apiData: [Tjenestebeskrivelse] = []
    
    init(){
        apiModel.apiStuff(callback: { [weak self] responseList in
            if let responseList = responseList {
                self?.apiData = responseList
            }
        })
    }
    
    func searchFilter(input: String) -> [Tjenestebeskrivelse]{
        return apiData.filter{$0.navn.lowercased().contains(input.lowercased()) && $0.emneordRefs.filter{$0.scalaTjenestebeskrivelseID.variant != "NY"}.count > 0}.sorted(by: { $0.navn < $1.navn})
    }
    
    // Matches structure with api services, and rules out "NY" //TODO: fix "NY" parse
    func getServiceList(graph: Graph) -> [Tjenestebeskrivelse]{
        return apiData.filter{$0.emneordRefs.filter{$0.psi == graph.id && $0.scalaTjenestebeskrivelseID.variant != "NY"}.count > 0}
    } 
}
