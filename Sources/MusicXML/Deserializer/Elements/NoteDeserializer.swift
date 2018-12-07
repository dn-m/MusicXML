//
//  NoteDeserializer.swift
//  MusicXML
//
//  Created by James Bean on 12/3/18.
//

import SWXMLHash

extension MusicXML {

    static func deserializeNote(_ noteIndexer: XMLIndexer) throws -> Note {
        return Note(
            pitch: try deserializePitch(noteIndexer),
            duration: try deserializeDuration(noteIndexer),
            durationType: try deserializeDurationType(noteIndexer)
        )
    }

    static func deserializePitch(_ noteIndexer: XMLIndexer) throws -> Pitch {
        return Pitch(
            step: try noteIndexer["pitch"]["step"].value(),
            octave: try noteIndexer["pitch"]["octave"].value()
        )
    }

    static func deserializeDuration(_ noteIndexer: XMLIndexer) throws -> Int {
        return try noteIndexer["duration"].value()
    }

    static func deserializeDurationType(_ noteIndexer: XMLIndexer) throws -> DurationType {
        guard let kind = DurationType.Kind(rawValue: try noteIndexer["type"].value()) else {
            throw Error.invalidDurationType(noteIndexer)
        }
        let size = (try? noteIndexer["type"].value(ofAttribute: "size"))
            .flatMap { DurationType.Size(rawValue: $0) }
        return DurationType(kind: kind, size: size ?? .full)
    }
}
