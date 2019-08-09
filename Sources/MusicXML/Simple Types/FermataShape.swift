//
//  FermataShape.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The fermata-shape type represents the shape of the fermata sign. The empty value is equivalent
/// to the normal value.
public enum FermataShape: String {
    case normal
    case angled
    case square
    case doubleAngled = "double-angled"
    case doubleSquare = "double-square"
    case doubleDot
    case halfCurve
    case curlew
    case none = ""
}

extension FermataShape: Equatable { }
extension FermataShape: Codable { }
