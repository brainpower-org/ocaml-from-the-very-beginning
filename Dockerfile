FROM codercom/code-server:latest

# Install opam and ocaml
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:avsm/ppa
RUN apt-get update
RUN apt-get install make gcc m4 mercurial darcs opam -y
RUN opam init -a --disable-sandboxing
RUN opam switch create latest 4.07.1
RUN opam switch set latest

# Install ocaml dependencies
RUN apt-get install fswatch -y
RUN opam install OUnit Core dune -y

# Add missing code-server data files
RUN mkdir -p /root/.code-server/Backups && mkdir -p /root/.code-server/extensions && mkdir -p /root/.code-server/User/workspaceStorage
RUN echo '{"rootWorkspaces":[],"folderURIWorkspaces":[],"emptyWorkspaceInfos":[],"emptyWorkspaces":[]}' > /root/.code-server/Backups/workspaces.json

# Install code-server extensions
ADD extensions extensions
RUN apt-get install unzip -y
RUN unzip extensions/jaredly.reason-vscode-1.5.2.vsix.zip 'extension/*' -d /tmp/jaredly.reason-vscode-1.5.2/
RUN mv /tmp/jaredly.reason-vscode-1.5.2/extension/ /root/.code-server/extensions/jaredly.reason-vscode-1.5.2/

RUN mkdir /repo
WORKDIR /repo
