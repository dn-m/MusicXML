//
//  Decoder.swift
//  XMLCoder
//
//  Created by Benjamin Wetherfield on 11/20/19.
//

internal extension Decoder {
    func gatherArray <T: Decodable>() throws -> [T] {
        var array = [T]()
        var container = try unkeyedContainer()
        while !container.isAtEnd {
            do {
                array.append(try container.decode(T.self))
            } catch DecodingError.typeMismatch(let type, _) where type == T.self {
                break
            }
        }
        return array
    }
}
