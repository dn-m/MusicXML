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
}

extension FermataShape: Equatable { }
extension FermataShape: Codable { }
