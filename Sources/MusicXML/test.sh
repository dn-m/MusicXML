groups="BendSound|Bezier|DashedFormatting|Font|PlacementPrintStyle|Position|Printout|PrintStyle|PrintStyleAlign|PrintStyleAlignObject|PrintStyleTrillSound|TextDecoration|TrillSound"
gsed -r -n "/$groups/ p" "$1"
