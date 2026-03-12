// Swatches for viewing filaments and their names

use <dotSCAD/src/rounded_cube.scad>

$fn = 30;

swatch_size = 24;
thicc = 2.25;
text_thicc = .5;

union() {
    difference() {
        rounded_cube([swatch_size, swatch_size, thicc], 1);
        translate([2, 2, thicc-text_thicc + 0.001])
        cube([swatch_size-4, swatch_size-4, text_thicc]);
    }

    
    translate([swatch_size/2, swatch_size/2, thicc-text_thicc - 0.1])
        linear_extrude(text_thicc) {

            // lines = ["PETG", "Trans.", "Teal"];
            lines = ["ABS", "Black"];

            text_size = 4;
            line_height = text_size + 2;
            font = "Iosevka:style=Bold";

            offset_y = floor(len(lines)/2)*line_height - (len(lines) % 2 == 0 ? 0.5 : 0)*line_height;

            echo(offset_y=offset_y);
            for (i = [0:len(lines)-1]) {
                translate([0, offset_y+-i*line_height, 0])
                    text(lines[i], text_size, font, halign = "center", valign = "center");
            }
        }
}
