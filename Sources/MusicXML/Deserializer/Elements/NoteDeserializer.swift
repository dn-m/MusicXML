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
            pitch: try deserializePitch(noteIndexer["pitch"]),
            duration: try deserializeDuration(noteIndexer["duration"]),
            durationType: try deserializeDurationType(noteIndexer["type"])
        )
    }

    static func deserializePitch(_ pitchIndexer: XMLIndexer) throws -> Pitch {
        return Pitch(
            step: try pitchIndexer["step"].value(),
            octave: try pitchIndexer["octave"].value()
        )
    }

    static func deserializeDuration(_ durationIndexer: XMLIndexer) throws -> Int {
        return try durationIndexer.value()
    }

    static func deserializeDurationType(_ typeIndexer: XMLIndexer) throws -> DurationType {
        guard let kind = DurationType.Kind(rawValue: try typeIndexer.value()) else {
            throw Error.invalidDurationType(typeIndexer)
        }
        let size = (try? typeIndexer.value(ofAttribute: "size"))
            .flatMap { DurationType.Size(rawValue: $0) }
        return DurationType(kind: kind, size: size ?? .full)
    }
}
