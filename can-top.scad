// A simple lid for a can that I have, with a slot for aluminium can tabs

dia = 100;
wall_thicc = 1;
$fn=200;
difference() {
    cylinder(15, dia/2+wall_thicc, dia/2+wall_thicc);
    translate([0, 0, wall_thicc])
        cylinder(15, dia/2, dia/2);
    cube([30, 8, 5], center=true);
}
