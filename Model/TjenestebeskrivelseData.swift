// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
import Foundation
// MARK: - WelcomeElement
struct Tjenestebeskrivelse: Codable, Hashable, Equatable     {
    let alternativtNavn: String
    let beskrivelse: String //Beskrivelse
    let beslektedeTjenester: String
    let beslektedeTjenesterRef: [TjenestebeskrivelseRef]
    let brosjyrer: String
    let brukOverordnet: Bool
    let datoOppdatert, datoOpprettet: String
    let datoPublisert: String?
    let dokumentRef: [DokumentRef]
    let emneordRefs: [EmneordRef]
    let flette: [String: Int]
    let frittFelt1: String
    let frittFelt2: String
    let frittFelt3: String
    let frittFelt4: String
    let frittFelt5: String
    let gyldigFra: String?
    let ingress: String //Top Text
    let internOpplysninger: String
    let internSaksgang: String
    let kostraID: String
    let kriterier: String //Kriterier
    let ledetekstFrittFelt1: String?
    let ledetekstFrittFelt2: String?
    let ledetekstFrittFelt3: String?
    let ledetekstFrittFelt4: String?
    let ledetekstFrittFelt5: String?
    let livsITRefs: [String]
    let lover: String //Lover
    let lovpalagtTjeneste: Bool
    let malgruppe: String //Hvem passer tjenesten for
    let merknaderOSK: String
    let navn: String
    let oppgrader: Bool
    let partnere: String // Samarbeidspartnere
    let pris: String //Pris
    let revisjon: Int
    let servicekontoretsAnsvar: String
    let servicelofte: String
    let servicesanksjon: String
    let servicevilkar: String
    let soknadBehandling: String // Behandling av saken din
    let soknadBehandlingstid: String //Saksbehandlingstid
    let soknadFrist: String // Søknadsfrist
    let soknadKlage: String //Klage
    let soknadMerknader: String
    let soknadMottaker: String // Søknaden sendes til
    let soknadSkjema: String //Søk her
    let soknadVedlegg: String // Dette må du legge ved søknaden
    let soknadVeiledning: String //Slik går du frem
    let statsID: String
    let stikkord: String
    let tjenesteEier: String
    let tjenestebeskrivelseID: TjenestebeskrivelseID
}


struct TjenestebeskrivelseRef: Codable, Equatable, Hashable {
    let navn: String
    let revisjon: Int
    let statusBeskrivelse: String
    let tjenestebeskrivelseID: TjenestebeskrivelseID
}

// MARK: - DokumentRef
struct DokumentRef: Codable, Equatable, Hashable {
    let dokumenttypeID: Int //1 = Regelverk, 2 = Regelverk, 8 = Regelverk , 5 = Les mer, 7 = Les mer, 6 = Skjema
    let land: String
    let lastesNed: Bool
    let sprak: String
    let tittel: String
    let uri: String
}

// MARK: - EmneordRef
struct EmneordRef: Codable, Equatable, Hashable {
    let psi: String
    let scalaTjenestebeskrivelseID: TjenestebeskrivelseID
}

// MARK: - TjenestebeskrivelseID
struct TjenestebeskrivelseID: Codable, Equatable, Hashable {
    let land: String
    let sprak: String
    let tjenesteID: Int
    let variant: String
    let versjon: Int
}

