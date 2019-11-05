FROM \
    ssidk/bifrost-base:2.0.5

LABEL \
    name="bifrost-ariba_resfinder" \
    description="Docker environment for ariba_resfinder in bifrost" \
    version="2.0.5" \
    DBversion="21/08/19" \
    maintainer="kimn@ssi.dk;"

RUN \
     conda install -yq -c conda-forge -c bioconda -c defaults ariba==2.13.3; \
    # In base image
    cd /bifrost_resources; \
    mkdir resfinder; \
    cd /bifrost_resources/resfinder; \
    ariba getref resfinder resfinder --version 149209d; \
    ariba prepareref -f resfinder.fa -m resfinder.tsv ref_db;

ENTRYPOINT \
    [ "/bifrost/whats_my_species/launcher.py"]
CMD \
    [ "/bifrost/whats_my_species/launcher.py", "--help"]