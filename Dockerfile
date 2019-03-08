FROM codercom/code-server

# get opam
RUN apt-get update
RUN apt-get install build-essential m4 git rsync mercurial darcs wget unzip bubblewrap fswatch -y
RUN wget https://github.com/ocaml/opam/releases/download/2.0.3/opam-2.0.3-x86_64-linux
RUN mv opam-2.0.3-x86_64-linux /usr/bin/opam
RUN chmod a+x /usr/bin/opam
RUN opam init -a --disable-sandboxing

# install ocaml dependencies
RUN opam install OUnit Core dune -y
RUN echo "eval $(opam env)" >> /root/.bashrc

# Install code-server extensions
# RUN mkdir -p /home/root/.code-server/extensions
RUN mkdir -p /root/.code-server/Backups && mkdir -p /root/.code-server/extensions
RUN echo '{}' > /root/.code-server/Backups/workspaces.json

ADD extensions extensions
RUN unzip extensions/jaredly.reason-vscode-1.5.2.vsix.zip 'extension/*' -d /tmp/jaredly.reason-vscode-1.5.2/
RUN mv /tmp/jaredly.reason-vscode-1.5.2/extension/ /root/.code-server/extensions/jaredly.reason-vscode-1.5.2/

RUN mkdir /repo
WORKDIR /repo
