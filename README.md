# NSJail for Perl 6

# Installation

Make sure you have all the NSJail dependencies installed on your system. As per the NSJail Dockerfile, this looks like:

```
apt-get install -y \
    autoconf \
    bison \
    flex \
    gcc \
    g++ \
    git \
    libprotobuf-dev \
    libnl-route-3-dev \
    libtool \
    make \
    pkg-config \
    protobuf-compiler
```

Then, just run 

```
zef install NSJail
# or
git clone https://github.com/aearnus/perl6-nsjail.git
cd perl6-nsjail/
zef install .
```

This will compile NSJail for you, no installation needed.