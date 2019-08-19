#!/usr/bin/env perl6

class Build {
    method build($dir) {
        'Building nsjail....'.say;
        qx{make -j4 -Cnative/nsjail/};
        qx{cp -f native/nsjail/nsjail resources/nsjail-cli};
        qx{make -Cnative/nsjail/ clean};
    }
}