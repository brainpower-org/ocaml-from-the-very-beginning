> Answers and notes for the coding questions in OCaml - From The Very Beginning

# OCaml - From The Very Beginning

## Prerequesites

* OCaml, `>= 4.06.0`. See [ocaml.org/install](https://ocaml.org/docs/install.html)
* GNU make, `>= 3.81`

## Getting Started

```
λ git clone https://github.com/marionebl/ocaml-from-the-very-beginning.git
λ cd ocaml-from-the-very-beginning
λ make
```

## Adding new solutions

```
λ touch src/making_lists.2.ml
λ make run/making_lists.2
```

## Listing available solutions

```
λ make ls
```

## Building single solutions

```sh
# Given src/4_making_lists.1.ml exists
λ make build/4.making_lists.1
ocamlc src/4.making_lists.1.ml -o build/4.making_lists.1
```

## Running single solutions

```sh
# Given src/making_lists.1.ml exists
λ make run/4.making_lists.1
ocaml src/4.making_lists.1.ml
```