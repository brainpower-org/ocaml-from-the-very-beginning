# OCaml from the very Beginning

* Study repository for learning OCaml
* Basic `jbuilder` setup
* TDD via `OUnit`
* Exercises from OCaml from the very Beginning

## Prerequesites

* OCaml, `>= 4.06.0`. See [ocaml.org/install](https://ocaml.org/docs/install.html)
* GNU make, `>= 3.81`
* jbuilder
* OUnit
* Core
* watchexec

```sh
opam install OUnit Core jbuilder

# May be available via pkg manager, e.g. brew
cargo install watchexec 
```

## Getting started

```sh
λ git clone https://github.com/sinnerschrader/ocaml-from-the-very-beginning.git
λ cd ocaml-from-the-very-beginning
λ make
λ cd chapter_n
watchexec -e ml make test
```

## Related

* [Reason from the very Beginning](https://github.com/sinnerschrader/reason-from-the-very-beginning)
