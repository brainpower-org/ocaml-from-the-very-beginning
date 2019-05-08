FROM brainpower/ocaml-cubicle:code-1.939-share-1.0.125

ADD . /repo
WORKDIR /repo

RUN opam install --deps-only -y .
RUN eval `opam config env` && dune runtest
