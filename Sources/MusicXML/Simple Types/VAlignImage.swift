//
//  VAlignImage.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The valign-image type is used to indicate vertical alignment for images and graphics, so it does
/// not include a baseline value. Defaults are implementation-dependent.
public enum VAlignImage: String {
    case top
    case middle
    case bottom
}

extension VAlignImage: Equatable { }
extension VAlignImage: Decodable { }
