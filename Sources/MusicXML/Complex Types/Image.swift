//
//  Image.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The image type is used to include graphical images in a score.
public struct Image {
    public let source: String
    public let type: String
    public let position: Position?
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlignImage?

    public init(source: String, type: String, position: Position? = nil, hAlign: LeftCenterRight? = nil, vAlign: VAlignImage? = nil) {
        self.source = source
        self.type = type
        self.position = position
        self.hAlign = hAlign
        self.vAlign = vAlign
    }
}

extension Image: Equatable { }
extension Image: Codable { }
