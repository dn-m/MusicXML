//
//  BarStyleColor.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The bar-style-color type contains barline style and color information.
public struct BarStyleColor {
    public let barStyle: BarStyle
    public let color: Color?
}

extension BarStyleColor: Equatable { }
extension BarStyleColor: Decodable { }
