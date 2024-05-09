//
//  APIModels.swift
//  WordsFactory
//
//  Created by Степан Потапов on 17.05.2023.
//

import Foundation

struct WordInformation: Codable {
    let word: String
    let phonetic: String?
    let meanings: [MeaningInformation]
}

struct MeaningInformation: Codable {
    let partOfSpeech: String
    let definitions: [DefinitionModel]
}

struct DefinitionModel: Codable {
    let definition: String
    let example: String?
}

