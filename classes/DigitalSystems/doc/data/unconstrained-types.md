<!--
Copyright © Telecom Paris
Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)

This file must be used under the terms of the CeCILL. This source
file is licensed as described in the file COPYING, which you should
have received as part of this distribution. The terms are also
available at:
https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
-->

Unconstrained types

---

It is possible to define unconstrained array types, that is, array types which lengths are not defined.
Several standard array types are unconstrained (`bit_vector`, `string`, `std_ulogic_vector`…) This feature is extremely convenient to write generic, highly reusable, code.
Of course, when declaring an object (signal, variable, constant…) of unconstrained type, the constraint must be specified:

```vhdl
signal v: bit_vector(47 downto 12);
```

Thanks to this feature, subprograms, entities and architectures can be written in a very generic way:

```vhdl
entity rbo is
  port(din:  in  bit_vector;
       dout: out bit_vector);
end entity rbo;

architecture arc of rbo is
  function reverse_bit_order(v: bit_vector) return bit_vector is
  begin
    ...
  end function reverse_bit_order;
begin
  dout <= reverse_bit_order(din);
end architecture arc;
```

As when declaring objects, the constraints must be given when calling subprograms or instantiating entities:

```vhdl
architecture sim of rbo_sim is
  signal a, b, c: bit_vector(13 to 19);
begin
  u0: entity work.rbo(arc) port map(a, b);
  c <= reverse_bit_order(b);
  assert a = c report "error" severity failure;
  ...
end architecture rbo_sim;
```

Of course, generic code must work in all possible contexts.
A common mistake consists in implicitly assuming that vectors have a given direction or bound.
In the code of the `reverse_bit_order` function shown above, it would be a mistake to consider that vector `v` is of type `bit_vector(n downto 0)` for some value `n`.
The function could well be called with a parameter of type `bit_vector(3 to 67)`…

Attributes exist that can be used to request the shape of objects.
The `length` attribute, for instance, evaluates as the size of a vector.
Using intermediate local copies with known declarations frequently simplifies the design of generic code:

```vhdl
function reverse_bit_order(v: bit_vector) return bit_vector is
  constant n:   natural                  := v'length; -- length attribute
  constant tmp: bit_vector(n-1 downto 0) := v;        -- local copy with known direction and bounds
  variable res: bit_vector(0 to n-1);                 -- result variable with known direction and bounds
begin
  for i in 0 to n-1 loop
    res(i) := tmp(i);
  end loop;
  return res;
end function reverse_bit_order;
```

In the `reverse_bit_order` example another option consists in constraining the `v` parameter, but of course this works only if its length is constant, which makes the code less generic:

```vhdl
function reverse_bit_order(v: bit_vector(15 downto 0)) return bit_vector is
  variable res: bit_vector(0 to 15); -- result variable with known direction bounds
begin
  for i in 0 to 15 loop
    res(i) := v(i);
  end loop;
  return res;
end function reverse_bit_order;
```

If the function is called with a parameter of type `bit_vector(5 to 20)` it will behave as expected: the left bit of the parameter (bit 5) is mapped to the left bit of `v` (`v(15)`).
Of course, if it is called with a parameter with more or less than 16 bits an error will be raised.

Note that the returned value cannot be constrained: `function f(...) return bit_vector(7 downto 0)` is not valid and causes a compilation error.
It is the `return` statement of the function that fixes the shape of the returned value.
With the first version of `reverse_bit_order`, if the function is called with a 20 bits parameter, the returned value is of type `bit_vector(0 to 19)`.
With the second version the function can be called only with a 16 bits parameter and the returned value is always of type `bit_vector(0 to 15)`.

<!-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0: -->
