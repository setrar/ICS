<!--
Copyright © Telecom Paris
Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)

This file must be used under the terms of the CeCILL. This source
file is licensed as described in the file COPYING, which you should
have received as part of this distribution. The terms are also
available at:
https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
-->

Wait statement in a process with sensitivity list

---

If you get an error like:

- Modelsim: `(vcom-1226) A wait statement is illegal for a process with a sensitivity list`
- GHDL: `error: wait statement not allowed in a sensitized process`

the reason is that you used a `wait` statement in a process with a sensitivity list.
Example:

```vhdl
process(a, b)
begin
  wait on a, b;
  s <= a xor b;
end process;
```

This is not valid because a sensitivity list ((`(a, b)` in the example) is itself a short-hand for a **unique** `wait` statement at the end of the process.
This valid process with a sensitivity list and no `wait` statement:

```vhdl
process(a, b)
begin
  s <= a xor b;
end process;
```

is equivalent to this other valid process with a `wait` statement and no sensitivity list:

```vhdl
process
begin
  s <= a xor b;
  wait on a, b;
end process;
```

In summary, use a sensitivity list or `wait` statements but not both in the same process.

Note: because most logic synthesizers have a limited support for wait statements, we usually use only sensitivity lists in synthesizable VHDL models, while a mixture of processes with wait statements and processes with sensitivity lists are frequently used in non-synthesizable models, like simulation environments.

<!-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0: -->
