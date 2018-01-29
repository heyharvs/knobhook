include <threads.scad>
$fn = 50 / 1;

// the thickness of the object you're hanging
knob_thickness = 25;

// the diameter of the hole
knob_diameter = 30;

// the diameter of the curve
knob_round = 5;

// the top diameter of the screw for countersinking

support_thickness = 3 / 1
support_screw_diameter = 4 / 1;
support_screw_diameter_top = 6.5 / 1;

// top base extension length
support_extends_top = 25;

// bottom base extension length
support_extends_bottom = 25;

support_cutoff = .6 / 1;

translate([0, 0, knob_thickness / 2]) {
    difference() {
        union() {
            translate([0, 0, knob_thickness / 2 + knob_round / 2]) {
                rotate_extrude(convexity = 20) {
                    //translate([0, knob_diameter / 2 + knob_round / 2, 0]) circle(knob_round / 2);
                    translate([knob_diameter / 2, 0, 0]) circle(knob_round / 2);
                }
                cylinder(knob_round, knob_diameter / 2, knob_diameter / 2, true);
            }
            cylinder(knob_thickness, knob_diameter / 2, knob_diameter / 2, true);
        }

        translate([knob_diameter * .9, 0, 0]) cube([knob_diameter, knob_diameter, 100], true);
        translate([-knob_diameter * .9, 0, 0]) cube([knob_diameter, knob_diameter, 100], true);
        translate([0, -knob_diameter * support_cutoff, 0]) cube([knob_diameter, knob_diameter, 100], true);
    }
}

hull() {
    translate([-knob_diameter * .8 / 2 + knob_round / 2, (-knob_diameter / 2) * support_cutoff + knob_round, (knob_thickness + knob_round) / 2]) cylinder(knob_thickness + knob_round, knob_round / 2, knob_round / 2, true);
    translate([knob_diameter * .8 / 2 - knob_round / 2, (-knob_diameter / 2) * support_cutoff + knob_round, (knob_thickness + knob_round) / 2]) cylinder(knob_thickness + knob_round, knob_round / 2, knob_round / 2, true);
}

translate([0, 0, -3]) {
    difference() {
        hull() {
            translate([0, -support_extends_bottom, 0]) cylinder(support_thickness, knob_diameter * .4, knob_diameter * .4);
            translate([0, support_extends_top, 0]) cylinder(support_thickness, knob_diameter * .4, knob_diameter * .4);
        }

        translate([0, support_extends_top, support_thickness / 2]) cylinder(3, support_screw_diameter / 2, support_screw_diameter_top / 2, true);
        translate([0, -support_extends_bottom, support_thickness / 2]) cylinder(3, support_screw_diameter / 2, support_screw_diameter_top / 2, true);
    }
}


//translate([0, knob_diameter / 2 + knob_round / 2, 0]) circle(knob_round / 2);
