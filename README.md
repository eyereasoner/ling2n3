# Lingua to Notation3 translator

## Synopsis

```
./ling2n3.sh examples/socrates.trig
```

This will produce:

- `examples/socrates.trig.n3` : the Notation3 version of the Lingua script
- `examples/socrates.trig.query` : the Notation3 query as expressed in the Lingua script

```
./n32ling.sh examples/socrates.trig.n3 examples/socrates.trig.query
```

This will produce:

- `examples/socrates.trig.n3.trig` : the Lingua version of the Notation3 script

## Description

[Lingua](https://github.com/eyereasoner/lingua/tree/main?tab=readme-ov-file#rdf-lingua) is an experimental language to express reasoning using the [TriG](https://www.w3.org/TR/trig/) syntax.

The `ling2n3.sh` is a script to translate Lingua to [Notation3](https://w3c.github.io/N3/spec/). This only works with the [EYE](https://github.com/eyereasoner/eye/tree/master) 9.9.7 or more recent.

The `n32ling.sh` is a script to translate Notation3 to Lingua.

## Bugs

- ling2n3.sh only works for trig files that don't require references to deeply nested lists with graph term references (but, a flat list with graph term references, such as required for `log:collectAllIn` should work).
- n32ling.sh only works for simple N3 files that do not require any graph terms in the premise or conclusion.

## Authors

- Dörthe Arndt
- Patrick Hochstenbach
