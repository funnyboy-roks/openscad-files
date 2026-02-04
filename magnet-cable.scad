// A thing that can be connected to a cable to make it magnetic

magnet_d = 7.9;
magnet_h = 2.7;
wall_thicc = 2;

$fn=30;

module cutout() {
    r = magnet_d / 2;
    cylinder(magnet_h, r, r);
}


difference() {
    cube([(magnet_d + wall_thicc) * 7 + wall_thicc, magnet_d + wall_thicc*2, magnet_h + wall_thicc + 5]);

    translate([wall_thicc + magnet_d/2, wall_thicc + magnet_d / 2, wall_thicc + .001 + 5])
    for (i = [0,1,5,6]) {
        #translate([i *(wall_thicc + magnet_d), 0, 0]) cutout();
    }

    translate([2 *(wall_thicc+magnet_d) + wall_thicc, -1, wall_thicc])
        cube([3 *(wall_thicc+magnet_d) - wall_thicc, magnet_d + wall_thicc*2 + 2, 10]);
}
