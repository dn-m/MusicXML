//
//  VirtualInstrument.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The virtual-instrument element defines a specific virtual instrument used for an instrument
/// sound.
public struct VirtualInstrument {
    // MARK: - Instance Properties

    // MARK: Elements

    public let library: String?
    public let name: String?

    // MARK: - Initializers

    public init(library: String? = nil, name: String? = nil) {
        self.library = library
        self.name = name
    }
}

extension VirtualInstrument: Equatable {}
extension VirtualInstrument: Codable {}

import XMLCoder
extension VirtualInstrument: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
