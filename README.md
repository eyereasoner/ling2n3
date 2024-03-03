# Lingua to Notation3 translator

## Synopsis

```
./ling2n3.sh examples/socrates.trig
```

This will produce:

- `examples/socrates.trig.n3` : the Notation3 version of the Lingua script
- `examples/socrates.trig.query` : the Notation3 query as expressed in the Lingua script
- `examples/socrates.trig.sh` : a script to execute the Notation3 and query 

```
./n32ling.sh examples/socrates.trig.n3 examples/socrates.trig.query
```

This will produce:

- `examples/socrates.trig.n3.trig` : the Lingua version of the Notation3 script
- `examples/socrates.trig.n3.sh` : a script to execute the Lingua script

## Description

[Lingua](https://github.com/eyereasoner/eye/tree/master/lingua) is an experimental language to express reasoning using the [TriG](https://www.w3.org/TR/trig/) syntax.

The `ling2n3.sh` is a script to translate Lingua to Notation3. This only works with the [EYE](https://github.com/eyereasoner/eye/tree/master) 9.9.7 reasoner that has support for named quads.

The `n32ling.sh` is a script to translate Notation3 to Lingua.

## Authors

- Dörthe Arndt
- Patrick Hochstenbach
