// A weird candle expirement that isn't really effective, but it exists now (:

candle_height = 50;
candle_d = 30;
wall_thicc = 1;

$fn=150;

difference() {
    cylinder(candle_height, d = candle_d + wall_thicc*2);
    translate([0, 0, wall_thicc])
        cylinder(candle_height, d = candle_d + wall_thicc);
}


translate([150, 0, 0]) {
    funnel_bottom_d = candle_d*.75;
    funnel_top_d = candle_d*1.5;
    funnel_d = max(funnel_bottom_d, funnel_top_d);
    funnel_height = 15;
    translate([0, 0, candle_height]) {
        translate([0, 0, funnel_height-wall_thicc])
            cylinder(wall_thicc, d=candle_d-wall_thicc*2);

        spokes = 2;
        intersection() {
            cylinder(funnel_height, d1=funnel_bottom_d, d2=funnel_top_d);
            for (i = [0:spokes-1]) {
                rotate([0, 0, 180/spokes * i])
                    translate([-funnel_d/2 + 1, 0, funnel_height-wall_thicc-2])
                        cube([funnel_top_d, wall_thicc, 3]);
            }
        }

        difference() {
            cylinder(funnel_height, d1=funnel_bottom_d, d2=funnel_top_d);
            translate([0, 0, -.05])
                cylinder(funnel_height + .1, d1=funnel_bottom_d-wall_thicc*2, d2=funnel_top_d-wall_thicc*2);
        }

        for (i = [0:spokes*2-1]) {
            rotate([0, 0, 180/spokes*i]) translate([-candle_d/2 + candle_d/8, 0, funnel_height])
                cylinder(5, d1=2, d2=0);
        }
    }

    difference() {
        id = candle_d*1.25;
        cylinder(h=candle_height + funnel_height-5 +wall_thicc-.001, d=id+wall_thicc*2);
        translate([0, 0, wall_thicc])
            cylinder(h=candle_height + funnel_height-5, d=candle_d+wall_thicc*2);
        translate([-id/2-wall_thicc*2, -id-wall_thicc, wall_thicc]) 
            cube([id+wall_thicc*4, id, 100]);
        translate([0, 0, candle_height])
            cylinder(funnel_height, d1=funnel_bottom_d-wall_thicc*2, d2=funnel_top_d-wall_thicc*2);
    }
}
