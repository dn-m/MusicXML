//
//  Inversion.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The inversion type represents harmony inversions. The value is a number indicating which
/// inversion is used: 0 for root position, 1 for first inversion, etc.
public struct Inversion {
    public let value: Int
    public let printStyle: PrintStyle

    public init(value: Int, printStyle: PrintStyle) {
        self.value = value
        self.printStyle = printStyle
    }
}

extension Inversion: Equatable { }
extension Inversion: Codable { }
