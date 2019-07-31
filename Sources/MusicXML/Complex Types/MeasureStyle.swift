//
//  MeasureStyle.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

import XMLCoder

/// A measure-style indicates a special way to print partial to multiple measures within a part.
/// This includes multiple rests over several measures, repeats of beats, single, or multiple
/// measures, and use of slash notation. The multiple-rest and measure-repeat symbols indicate the
/// number of measures covered in the element content. The beat-repeat and slash elements can cover
/// partial measures. All but the multiple-rest element use a type attribute to indicate starting
/// and stopping the use of the style.
public struct MeasureStyle {
    public let number: Int
    public let font: Font
    public let color: Color
    public let kind: Kind
}

extension MeasureStyle {
    public enum Kind {
        case beatRepeat(BeatRepeat)
        case measureRepeat(MeasureRepeat)
        case multipleRest(MultipleRest)
        case slash(Slash)
    }
}

extension MeasureStyle.Kind: Equatable { }
extension MeasureStyle.Kind: Codable {
    enum CodingKeys: String, CodingKey {
        case beatRepeat
        case measureRepeat
        case multipleRest
        case slash
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .beatRepeat(value):
            try container.encode(value, forKey: .beatRepeat)
        case let .measureRepeat(value):
            try container.encode(value, forKey: .measureRepeat)
        case let .multipleRest(value):
            try container.encode(value, forKey: .multipleRest)
        case let .slash(value):
            try container.encode(value, forKey: .slash)
        }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self = .beatRepeat(try container.decode(BeatRepeat.self, forKey: .beatRepeat))
        } catch {
            do {
                self = .measureRepeat(try container.decode(MeasureRepeat.self, forKey: .measureRepeat))
            } catch {
                do {
                    self = .multipleRest(try container.decode(MultipleRest.self, forKey: .multipleRest))
                } catch {
                    self = .slash(try container.decode(Slash.self, forKey: .slash))
                }
            }
        }
    }
}

extension MeasureStyle.Kind.CodingKeys: XMLChoiceCodingKey { }

extension MeasureStyle: Equatable { }
extension MeasureStyle: Codable { }



