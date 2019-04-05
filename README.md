# OCaml from the very Beginning

* Study repository for learning OCaml
* Basic `jbuilder` setup
* TDD via `OUnit`
* Exercises from OCaml from the very Beginning

## Prerequesites

* Docker
* git

## Getting started

```sh
git clone https://github.com/sinnerschrader/ocaml-from-the-very-beginning.git
cd ocaml-from-the-very-beginning

docker-compose pull
docker-compose up # open browser at http://localhost:8443

# Inside the container, e.g. via VSCode terminal
dune runtest --watch
```

After a first successful build the IDE support should work.
Reload the VSCode window if you get "Unbound Module" errors.

## Trouble Shooting

### Can not find local build dir

```sh
git clean -x "**/*.merlin"
rm -rf _build
dune runtest
```

## Related

* [Reason from the very Beginning](https://github.com/sinnerschrader/reason-from-the-very-beginning)
