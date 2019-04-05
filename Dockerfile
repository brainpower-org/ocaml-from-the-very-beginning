FROM brainpower/ocaml-cubicle

USER root
RUN mkdir /repo
WORKDIR /repo

USER opam
ADD code-server.sh /
RUN ext install maelvalais.dune 0.0.5
RUN ext install freebroccolo.reasonml 1.0.38 

