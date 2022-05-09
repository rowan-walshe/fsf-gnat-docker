# CodeWars - Ada Proposal

Some examples to support the proposal to add Ada as a supported language to Codewars.

## Installation

GNAT is a free-software Ada compiler, that forms part of GCC. It can be installed easly using apt, or your package manager of choice. In the example Dockerfile the latest version is installed from apt using:

```
apt-get install -y gnat-12 gprbuild
```

gnat-12 supports the latest Ada 2022 standard (superseding Ada 2012), which adds a number of new features such as Big Numbers.

`build_image.sh` will build and tag a gnat-fsf image using the Dockerfile.


## Examples
There are three examples, two which show passing and failing tests giving output in the format specified in Codewars' [docs](https://github.com/codewars/runner/blob/main/docs/messages.md), and a third which demonstrates using a new Ada 2022 [feature](https://learn.adacore.com/courses/whats-new-in-ada-2022/chapters/container_aggregates.html).

The examples can be run by using the `code_runner_*.sh` scripts. These assume you have built and tagged a `fsf-gnat` image, which can be done easily using the `build_image.sh` script.

The `code_runner_*.sh` scripts are written in a format mimicking the "roughly equivalent" process described in Codewars' [README](https://github.com/codewars/runner/blob/main/README.md#code)

## preloader.c

This isn't required, but is something [https://learn.adacore.com/](https://learn.adacore.com/) seems to do as part of their code runner equivalent, to try and prevent users from abusing their ability run arbitrary code.

https://github.com/AdaCore/learn/tree/master/backend/infrastructure