//
//  Dashes.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The dashes type represents dashes, used for instance with cresc. and dim. marks.
public struct Dashes {
    public let type: StartStopContinue
    public let dashedFormatting: DashedFormatting

    public init(type: StartStopContinue, dashedFormatting: DashedFormatting) {
        self.type = type
        self.dashedFormatting = dashedFormatting
    }
}

extension Dashes: Equatable { }
extension Dashes: Codable { }
