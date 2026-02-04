// A box for holding poker chips

chip_dia = 38.2;
chip_height = 2.9;

wall_thicc = 2;
bottom_thicc = 2;
top_thicc = 1;
stack_gap = 1;
top_gap = 2;

rows = 3;
stacks = 5;

stack_size = 10;
stack_height = chip_height*stack_size;

$fn=100;

inside_width = stack_height*stacks + stack_gap * (stacks-1);
inside_depth = chip_dia*rows + stack_gap * (rows-1);

top_depth = inside_depth + top_thicc;
module top() {
    translate([0, top_thicc/2, 0]) union() {
        cube([inside_width + wall_thicc + .5, top_depth - top_thicc + .5, top_thicc]);
        translate([0, 0, top_thicc/2]) {
            rotate([0, 90, 0])
                cylinder(inside_width + wall_thicc, d=top_thicc);

            translate([0, inside_depth + .5, 0])
                rotate([0, 90, 0])
                cylinder(inside_width + wall_thicc + .5, d=top_thicc);
        }
    }
}

difference() {
    cube([inside_width+wall_thicc*2, inside_depth+wall_thicc*2, bottom_thicc + chip_dia + top_gap + top_thicc + bottom_thicc]);
    translate([wall_thicc, wall_thicc, chip_dia/2 + bottom_thicc])
        cube([inside_width, inside_depth, chip_dia*2]);

    for (yi = [0:rows-1]) {
        for (xi = [0:stacks-1]) {
            x = wall_thicc + (stack_gap+stack_height)*xi;
            y = (wall_thicc+chip_dia/2)+((chip_dia+stack_gap)*yi);
            translate([x, y, chip_dia/2 + bottom_thicc])
                rotate([0, 90, 0])
                    cylinder(chip_height*10, d=chip_dia);
            if (xi > 0) {
                translate([x - stack_gap - .1, y, chip_dia/2 + bottom_thicc])
                    rotate([0, 90, 0])
                        cylinder(chip_height, d=chip_dia-stack_gap*4);
            }
        }
    }

    thumb_dia = chip_dia*.4;
    for (yi = [0:rows-1]) {
        y = (wall_thicc+chip_dia/2)+((chip_dia+stack_gap)*yi);
        for (x = [-wall_thicc/2, inside_width + wall_thicc - wall_thicc/2]) {
            translate([x, y, chip_dia/2 + bottom_thicc])
                rotate([0, 90, 0])
                    cylinder(wall_thicc*2, thumb_dia/2, thumb_dia/2);
            translate([x, y - thumb_dia/2, chip_dia/2 + bottom_thicc])
                cube([wall_thicc*2, thumb_dia, 100]);
        }
    }

    translate([wall_thicc - .5, (inside_depth + wall_thicc*2)/2 - top_depth*1.01/2, bottom_thicc + chip_dia + top_gap])
        scale([1.01, 1.01, 1.01])
        top();

    translate([inside_width + wall_thicc - wall_thicc/2, wall_thicc, chip_dia + wall_thicc + top_gap])
        cube([5, inside_depth, 5]);
}

translate([inside_width + wall_thicc*2 + 50, 0, 0])
    top();
