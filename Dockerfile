FROM brainpower/ocaml-cubicle

USER root
RUN mkdir /repo
RUN chown -R opam:opam /repo
WORKDIR /repo


USER opam
ADD --chown=opam:opam . ./
RUN opam install --deps-only -y .

SHELL ["/bin/bash", "--login" , "-c"]
# RUN eval $(opam env)
RUN dune runtest
