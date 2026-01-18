// Clip for holding five LAMY T10 ink cartridges (https://www.lamy.com/en-us/p/lamy-t-10-ink/50727869088078)

cart_r = 7.2 / 2;

wall_thicc = 2;

$fn=50;

clip_width = cart_r * 2 + wall_thicc * 2;

module clip() {
    difference() {
        cube([clip_width, wall_thicc, clip_width]);
        translate([cart_r + wall_thicc, 5, cart_r + wall_thicc])
            rotate([90, 0, 0])
            cylinder(10, cart_r, cart_r);
    }
}

module comb() {
    difference() {
        union() {
            for (i = [0:4]) {
                translate([i * (clip_width - wall_thicc), 0, 0])
                    clip();
            }
        }
        translate([-clip_width / 2 + wall_thicc, -wall_thicc / 2, clip_width - 3.4])
            cube([clip_width * 6, wall_thicc * 2, clip_width]);
    }
}

union() {
    for (i = [0:5]) {
        translate([i * (clip_width - wall_thicc), 0, 0])
            cube([wall_thicc, 30, wall_thicc]);
    }
    cube([clip_width * 4 + wall_thicc, 30, 1]);
    comb();
    translate([0, 30, 0]) comb();
}
