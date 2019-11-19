//
//  AttributeGroup.swift
//  MusicXML
//
//  Created by Benjamin Wetherfield on 11/18/19.
//

internal protocol AttributeGroup { }

extension BendSound: AttributeGroup { }
extension Bezier: AttributeGroup { }
extension DashFormatting: AttributeGroup { }
extension Font: AttributeGroup { }
extension PlacementPrintStyle { }
extension Position: AttributeGroup { }
extension Printout: AttributeGroup { }
extension PrintStyle: AttributeGroup { }
extension PrintStyleAlign: AttributeGroup { }
extension PrintStyleAlignObject: AttributeGroup { }
extension PrintStyleTrillSound: AttributeGroup { }
extension TextDecoration: AttributeGroup { }
extension TrillSound: AttributeGroup { }
extension YesNo: AttributeGroup { }
extension YesNoNumber: AttributeGroup { }
