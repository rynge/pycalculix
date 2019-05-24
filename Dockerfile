FROM opensciencegrid/osgvo-ubuntu-xenial

RUN apt-get update && apt-get install -y --no-install-recommends \
        calculix-ccx \
        gmsh \
        python3 \
        python3-pip \
        python3-tk \
        sudo

RUN pip3 install --upgrade pip && \
    python3 -mpip install -U numpy && \
    python3 -mpip install -U matplotlib && \
    python3 -mpip install -U git+https://github.com/joeborrello/pycalculix.git && \
    pycalculix-add-feaprograms
    
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

