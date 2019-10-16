//
//  ScoreTestCaseManifest.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 10/14/19.
//

import Foundation

struct ScoreTestCaseManifest: Codable {

    struct Parsing: Codable {

        private enum CodingKeys: String, CodingKey {
            case xmlFileName = "xml_file_name"
            case assert
        }

        let xmlFileName: String
        let assert: Bool
    }

    struct Comparison: Codable {
        private enum CodingKeys: String, CodingKey {
            case expectationClassName = "expectation_class_name"
            case assert
        }

        let expectationClassName: String
        let assert: Bool
    }

    struct Metadata: Codable {
        private enum CodingKeys: String, CodingKey {
            case displayName = "display_name"
            case source
            case description
        }

        let displayName: String
        let source: String?
        let description: String?
    }

    let parsing: Parsing
    let comparison: Comparison?
    let metadata: Metadata
}
