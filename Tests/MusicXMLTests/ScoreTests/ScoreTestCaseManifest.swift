//
//  ScoreTestCaseManifest.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 10/14/19.
//

import Foundation

struct ScoreTestCaseManifest {
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
    private(set) var disabled: Bool = false
}

extension ScoreTestCaseManifest: Codable {
    private enum CodingKeys: String, CodingKey {
        case parsing
        case comparison
        case metadata
        case disabled
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.parsing = try container.decode(Parsing.self, forKey: .parsing)
        self.comparison = try container.decodeIfPresent(Comparison.self, forKey: .comparison)
        self.metadata = try container.decode(Metadata.self, forKey: .metadata)
        self.disabled = try container.decodeIfPresent(Bool.self, forKey: .disabled) ?? false
    }
}
