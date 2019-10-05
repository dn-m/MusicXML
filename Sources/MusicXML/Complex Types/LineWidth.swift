//
//  LineWidth.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The line-width type indicates the width of a line type in tenths. The text content is also
/// expressed in tenths.
public struct LineWidth {
    public let value: Tenths
    public let type: LineWidthType

    public init(value: Tenths, type: LineWidthType) {
        self.value = value
        self.type = type
    }
}

extension LineWidth: Equatable { }
extension LineWidth: Codable { }
