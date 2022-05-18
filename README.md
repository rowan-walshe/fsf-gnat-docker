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
There are five examples, four of which show passing and failing tests giving output in the format specified in Codewars' [docs](https://github.com/codewars/runner/blob/main/docs/messages.md), and an other which demonstrates using a new Ada 2022 [feature](https://learn.adacore.com/courses/whats-new-in-ada-2022/chapters/container_aggregates.html).

The examples can be run by using the `*.sh` scripts in the examples directory. These assume you have built and tagged a `fsf-gnat` image, which can be done easily using the `build_image.sh` script.

The example scripts are written in a format mimicking the "roughly equivalent" process described in Codewars' [README](https://github.com/codewars/runner/blob/main/README.md#code)

### Example 1
This shows 3 tests being run, which all pass. This example uses the `Assert` producedure defined in `Codewars_Test`.
```ada
Assert (Multiply (5, 6) = 30);
Assert (Multiply (12, 12) = 144);
Assert (Multiply (-2, 3) = -6);
```
```sh
<PASSED::>Test Passed
<PASSED::>Test Passed
<PASSED::>Test Passed
```

### Example 2
This shows 3 tests being run, some of which fail. This example also uses the `Assert` producedure defined in `Codewars_Test`, but this time provides a message to be displayed if a test fails.
```ada
Assert (Multiply (2, 2) = 4, "2 * 2 should equal 4");
Assert (Multiply (12, 12) = 144, "12 * 12 should equal 144");
Assert (Multiply (-2, 3) = -6, "-2 * 3 should equal -6");
```
```sh
<PASSED::>Test Passed
<FAILED::>12 * 12 should equal 144
<FAILED::>-2 * 3 should equal -6
```

### Example 3
This example highlights a limitation of using the basic `Assert` procedure. As the user's code is run outside of the library, there is no way for the library catch exceptions raised from the user's code. This means that the program will stop executing, and will not run all test cases.
```ada
--  Multiply is erroneously implemented as X ** Y instead of X * Y
Assert (Multiply (2, 2) = 4, "2 * 2 should equal 4");
Assert (Multiply (12, 12) = 144, "12 * 12 should equal 144");
Assert (Multiply (-2, 3) = -6, "-2 * 3 should equal -6");
```
```sh
<PASSED::>Test Passed

raised CONSTRAINT_ERROR : s-expont.adb:146 overflow check failed
```

### Example 4
With a little bit more boilerplate code, you can use the `Test_Wrapper` procedure defined as part of Codewars_Test. This allows the library to wrap the call to the user's function so that exceptions are caught, and all tests are run.
```ada
   type Params_T is record
      X, Y : Integer;
   end record;

--  Multiply is erroneously implemented as X ** Y instead of X * Y
   function Run_Program (Params : Params_T) return Integer is
     (Multiply (Params.X, Params.Y));

   procedure Run_Test is new Codewars_Test.Test_Wrapper
     (Inputs_T     => Params_T,
      Output_T     => Integer,
      Run_Program  => Run_Program,
      "="          => "=");

begin

   Run_Test ((2, 2), 30, "2 * 2 should equal 4");
   Run_Test ((12, 12), 144, "12 * 12 should equal 144");
   Run_Test ((-2, 3), -6, "-2 * 3 should equal -6");
```
```
<PASSED::>Test Passed
<ERROR::>s-expont.adb:146 overflow check failed
<FAILED::>12 * 12 should equal 144
<FAILED::>-2 * 3 should equal -6
```

## preloader.c

This isn't required, but is something [https://learn.adacore.com/](https://learn.adacore.com/) seems to do as part of their code runner equivalent, to try and prevent users from abusing their ability run arbitrary code.

https://github.com/AdaCore/learn/tree/master/backend/infrastructure