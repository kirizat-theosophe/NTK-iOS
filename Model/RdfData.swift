//
//  RdfData.swift
//  NTK
//
//  Created by Stine Marie Vørner on 16/03/2022.
//

import Foundation

// MARK: - RDFData
struct RDFData: Codable {
    let graph: [Graph]
    let context: Context

    enum CodingKeys: String, CodingKey {
        case graph = "@graph"
        case context = "@context"
    }
}

// MARK: - Context
struct Context: Codable {
    let narrower, inScheme: BroadMatch
    let prefLabel: ContextAltLabel
    let broadMatch, topConceptOf: BroadMatch
    let hiddenLabel, note: ContextAltLabel
    let broader, related, exactMatch: BroadMatch
    let altLabel: ContextAltLabel
    let closeMatch: BroadMatch
    let rdf, owl, xsd, skos: String
    let rdfs: String
}

// MARK: - ContextAltLabel
struct ContextAltLabel: Codable {
    let id: String

    enum CodingKeys: String, CodingKey {
        case id = "@id"
    }
}

// MARK: - BroadMatch
struct BroadMatch: Codable {
    let id: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case id = "@id"
        case type = "@type"
    }
}

// MARK: - Graph
struct Graph: Codable, Identifiable, Hashable{
    static func == (lhs: Graph, rhs: Graph) -> Bool {
        true
    }
    
    var customId = UUID()
    let id: String
    let type: TypeEnum
    let prefLabel: [AltLabelElement]?
    let broader: Broader?
    let hiddenLabel: [AltLabelElement]?
    let inScheme: String?
    let note: [AltLabelElement]?
    let related, narrower: Broader?
    let broadMatch: String?
    let topConceptOf: String?
    let exactMatch: String?
    let altLabel: [AltLabelElement]?
    let closeMatch: String?
    var narrowers: [Graph] = []
    
    enum CodingKeys: String, CodingKey {
        case id = "@id"
        case type = "@type"
        case prefLabel, broader, hiddenLabel, inScheme, note, related, narrower, broadMatch, topConceptOf, exactMatch, altLabel, closeMatch
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func localizedPrefLabel(_ preferredLanguage: String) -> AltLabelElement? {
        if let localizedLabel = prefLabel?.first(where: { $0.language.rawValue == preferredLanguage }) {
            return localizedLabel
        } else {
            return prefLabel?.first
        }
    }
    
    func localizedPrefLabel(by idUrl: String, preferredLanguage: String) -> AltLabelElement? {
        if let localizedLabel = prefLabel?.first(where: { $0.value == idUrl && $0.language.rawValue == preferredLanguage }) {
            return localizedLabel
        } else {
            return prefLabel?.first(where: { $0.value == idUrl })
        }
    }
}

// MARK: - AltLabelElement
struct AltLabelElement: Codable, Identifiable, Hashable {
    var id = UUID()
    let language: Language
    let value: String

    enum CodingKeys: String, CodingKey {
        case language = "@language"
        case value = "@value"
    }
}

enum Language: String, Codable {
    case en = "en"
    case nb = "nb"
    case nn = "nn"
}

enum Broader: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Broader.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Broader"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

enum TypeEnum: String, Codable {
    case owlOntology = "owl:Ontology"
    case skosConcept = "skos:Concept"
    case skosConceptScheme = "skos:ConceptScheme"
}
