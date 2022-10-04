//
//  Categories.swift
//  NTK
//
//  Created by Stine Marie Vørner on 02/03/2022.
//

import Foundation

class Categories: ObservableObject {
    
  //  private var rdfParsing: RdfParsing = RdfParsing()
    
//    @Published var rdfMainCategories : [MainCategory] = [
//    ]
    
  //  var isThere: Bool = true
    
//    func getMainCategories() -> [Graph]{
//        return rdfParsing.all.filter { $0.topConceptOf != nil }
//    }
    
    @Published var demokratiOgInnbyggerrettigheter: [MainCategory] = [
        MainCategory(
        title: "Demokrati og Innbyggerrettigheter",
        subCategory: [SubCategory(
            title: "Medvirkning",
            serviceList: [ServiceList(
                title: "Innbyggerforslag",
                service: [Service(
                    id: 143206,
                    navn: "Innbyggerforslag",
                    ingress: "Når kommunen du bor i planlegger utbygging eller verning, har du som innbygger rett til å si din mening. Kommunen skal sørge for å få innspill fra sine innbyggere.",
                    beskrivelse: "Du har rett til å uttale deg i saker som gjelder kommunal planlegging. Kommunen skal tilstrebe sørst mulig offentlighet og reell medvirkning i planarbeidet. Særlig har kommunen et ansvar for å sørge for å få innspill fra grupper som krever spesiell tilrettelegging, slik som barn og unge. Tidlig i planprosessen bør kommunen bestemme hvordan denne medvirkningen skal skje.</p>\r\n<p>\r\n\tKommunen skal utarbeide følgende planer:</p>\r\n<ul>\r\n\t<li>\r\n\t\tKommunal planstrategi (strategiske valg knyttet til samfunnsutviklingen)</li>\r\n\t<li>\r\n\t\tKommuneplan (overordnet plan for utvikling av kommunesamfunnet og for bruk og vern av arealer i kommunen)</li>\r\n\t<li>\r\n\t\tReguleringsplan (arealplankart med bestemmelser som fastlegger bruk og vern i bestemte områder)",
                    malgruppe: "Alle som berøres av de planene som utarbeides, slik som organisasjoner, brukergrupper næringsliv og enkeltpersoner",
                    pris: "",
                    kriterier: "",
                    lover: "Se spesielt&nbsp;plan- og bygningsloven kap. 5 Medvirkning i planleggingen.",
                    dokumentRefSet: [DataRef(
                        dokmentID: 201585,
                        tittel: "Medvirkning i planprosesser (doga.no)",
                        uri: "https://doga.no/verktoy/folketrakk/folketrakk-veilederen/medvirkning-i-planprosesser/")],
                    soknadVeiledning: "Forslaget til kommunal planstrategi skal gjøres offentlig minst 30 dager før kommunestyrets behandling. Kommunen skal sende forslag til kommuneplan og reguleringsplan på høring til statlige, regionale og kommunale organer og til ulike organisasjoner og institusjoner som blir berørt av forslaget. Minst ett eksemplar av planforslaget skal være fysisk lett tilgjengelig, slik at enhver kan sette seg inn i det. Forslaget skal ogs&aring; gjøres tilgjengelig elektronisk. Det gis en frist for å uttale seg. &nbsp;</p>\r\n<ul>\r\n\t<li>\r\n\t\tKommuneplan: Frist for å gi uttalelse eller fremme innsigelse til kommuneplanens arealdel er minst seks uker</li>\r\n\t<li>\r\n\t\tReguleringsplan: Frist for å gi uttalelse eller fremme innsigelse er minst seks uker</li>\r\n</ul>\r\n<p>\r\n\tInnsigelse kan bare fremmes av offentlige myndigheter."),
                         Service(
                            id: 143206,
                            navn: "Kommunal planlegging - medvirkning",
                            ingress: "Når kommunen du bor i planlegger utbygging eller verning, har du som innbygger rett til å si din mening. Kommunen skal s&oslash;rge for å få innspill fra sine innbyggere.",
                            beskrivelse: "Du har rett til å uttale deg i saker som gjelder kommunal planlegging. Kommunen skal tilstrebe størst mulig offentlighet og reell medvirkning i planarbeidet. Særlig har kommunen et ansvar for å sørge for å få innspill fra grupper som krever spesiell tilrettelegging, slik som barn og unge. Tidlig i planprosessen bør kommunen bestemme hvordan denne medvirkningen skal skje.</p>\r\n<p>\r\n\tKommunen skal utarbeide følgende planer:</p>\r\n<ul>\r\n\t<li>\r\n\t\tKommunal planstrategi (strategiske valg knyttet til samfunnsutviklingen)</li>\r\n\t<li>\r\n\t\tKommuneplan (overordnet plan for utvikling av kommunesamfunnet og for bruk og vern av arealer i kommunen)</li>\r\n\t<li>\r\n\t\tReguleringsplan (arealplankart med bestemmelser som fastlegger bruk og vern i bestemte områder)",
                            malgruppe: "Alle som berøres av de planene som utarbeides, slik som organisasjoner, brukergrupper næringsliv og enkeltpersoner",
                            pris: "",
                            kriterier: "",
                            lover:  "Se spesielt&nbsp;plan- og bygningsloven kap. 5 Medvirkning i planleggingen",
                            dokumentRefSet: [DataRef(
                                dokmentID: 201585,
                                tittel: "Medvirkning i planprosesser (doga.no)",
                                uri: "https://doga.no/verktoy/folketrakk/folketrakk-veilederen/medvirkning-i-planprosesser/")],
                            soknadVeiledning: "Forslaget til kommunal planstrategi skal gjøres offentlig minst 30 dager før kommunestyrets behandling. Kommunen skal sende forslag til kommuneplan og reguleringsplan på høring til statlige, regionale og kommunale organer og til ulike organisasjoner og institusjoner som blir berørt av forslaget. Minst ett eksemplar av planforslaget skal være fysisk lett tilgjengelig, slik at enhver kan sette seg inn i det. Forslaget skal ogs&aring; gjøres tilgjengelig elektronisk. Det gis en frist for å uttale seg. &nbsp;</p>\r\n<ul>\r\n\t<li>\r\n\t\tKommuneplan: Frist for å gi uttalelse eller fremme innsigelse til kommuneplanens arealdel er minst seks uker</li>\r\n\t<li>\r\n\t\tReguleringsplan: Frist for å gi uttalelse eller fremme innsigelse er minst seks uker</li>\r\n</ul>\r\n<p>\r\n\tInnsigelse kan bare fremmes av offentlige myndigheter.")]),
                          ServiceList(
                            title: "Tolketjeneste",
                            service: [Service(
                                id: 73884,
                                navn: "Retten til tolk",
                                ingress: "Når kommunen du bor i planlegger utbygging eller verning, har du som innbygger rett til å si din mening. Kommunen skal sørge for å få innspill fra sine innbyggere.",
                                beskrivelse: "Du har rett til tolk når det er nødvendig for å motta en tjeneste. Det er kommunen som vurderer om det er nødvendig med tolk. Hvis du trenger å søke for å få en tjeneste, og du ikke forstår søknaden eller forstår dine rettigheter og plikter, er det sannsynligvis nødvendig med tolk. I alminnelig og daglig kommunikasjon mellom deg og kommunen, skolen eller barnehagen vil det sannsynligvis ikke regnes som nødvendig med tolk.</p>\r\n<p>\r\n\tRetten til tolk gjelder</p>\r\n<ul>\r\n\t<li>\r\n\t\talle som ikke snakker norsk</li>\r\n\t<li>\r\n\t\tde som snakker samisk</li>\r\n\t<li>\r\n\t\td&oslash;vblinde, d&oslash;ve og hørselshemmede.</li>\r\n</ul>\r\n<p>\r\n\tNår du får tolkehjelp, skal det være fra en voksen, kvalifisert tolk, som har taushetsplikt om saken din.",
                                malgruppe: "Alle som berøres av de planene som utarbeides, slik som organisasjoner, brukergrupper næringsliv og enkeltpersoner",
                                pris: "",
                                kriterier: "",
                                lover: "Se spesielt:</p>\r\n<ul>\r\n\t<li>\r\n\t\tI tillegg til tolkeloven og tolkeforskriften, se pasient- og brukerrettighetsloven &sect;&sect; 3-1 og 3-2 om retten til å få informasjon om din helsetilstand</li>\r\n\t<li>\r\n\t\thelse- og omsorgstjenesteloven &sect; 3-10 om rettigheter for samisk språk</li>\r\n\t<li>\r\n\t\tforvaltningsloven &sect;&sect; 13 til 13e om taushetsplikt.",
                                dokumentRefSet: [DataRef(
                                    dokmentID: 201637,
                                    tittel: "Lov om offentlige organers ansvar for bruk av tolk mv. (tolkeloven)",
                                    uri: "https://lovdata.no/lov/2021-06-11-79")],
                                soknadVeiledning: "Det er kommunens ansvar å vurdere om det er nødvendig med tolk, og hvis svaret er ja, å oppnevne tolk.&nbsp;En kvalifisert tolk er en som oppfyller kravene i Nasjonalt tolkeregister. Kommunen skal bruke kvalifiserte tolker, så sant det ikke er et nødstilfelle. Det kan ta tid å innhente kvalifiserte tolker, og dette kan bety noe ventetid.</p>\r\n<p>\r\n\tTolking kan foregå personlig eller via skjerm eller telefon.</p>\r\n<p>\r\n\tTolken skal tolke nøyaktig det som blir sagt i samtalen og skal være helt upartisk og nøytral i saken.</p>\r\n<p>\r\n\tTolken skal være voksen og har taushetsplikt om saken din.")])
                         ],
            subCategoryClass: SubCategoryClass(
                title: "Subcategory Class")),
                      SubCategory(
                        title: "Personopplysninger",
                        serviceList: [ServiceList(
                            title:"Personvern",
                            service: [Service(
                                id: 12,
                                navn: "Personvern - dine rettigheter",
                                ingress: "Ingress",
                                beskrivelse: "Beskrivelse",
                                malgruppe: "Målgruppe",
                                pris: "",
                                kriterier: "",
                                lover: "",
                                dokumentRefSet: [DataRef(
                                    dokmentID: 34,
                                    tittel: "Tittel",
                                    uri: "URL")],
                                soknadVeiledning: "Søknad veiledning"),
                                      Service(
                                        id: 3466,
                                        navn: "Personvernombud",
                                        ingress: "Ingree",
                                        beskrivelse: "Beskrivelse",
                                        malgruppe: "Målgruppe",
                                        pris: "",
                                        kriterier: "",
                                        lover: "",
                                        dokumentRefSet: [DataRef(
                                            dokmentID: 625,
                                            tittel: "Tittel",
                                            uri: "URL")],
                                        soknadVeiledning: "Søknad veiledning")])],
                        subCategoryClass: SubCategoryClass(
                            title: "Subcategory Class"))],
        mainCategoryClass: [MainCategoryClass(
            title: "Demokrati og Innbyggerrettigheter")])]
    
  
                                

    
// FRA KONSTANTIN Fredag 04.03
    
//    func getAllCategories(_ allCat: [MainCategory]){
//        return allCat.filter({$0.isSubcategory})
//    }
//    func getSubcategoryForCategory(_ allCat: [SubCategory]){
//        return allCat.filter({MainCategory.link == $0.broader})
//    }
}
