<!--
Copyright © Telecom Paris
Copyright © Renaud Pacalet (renaud.pacalet@telecom-paris.fr)

This file must be used under the terms of the CeCILL. This source
file is licensed as described in the file COPYING, which you should
have received as part of this distribution. The terms are also
available at:
https://cecill.info/licences/Licence_CeCILL_V2.1-en.html
-->

Comments

---

[TOC]

---

# Introduction

Any decent programming language supports comments.
In VHDL they are especially important because understanding a VHDL code, even moderately sophisticated, is frequently challenging.

# Single line comments

A single line comment starts with two hyphens (`--`) and extends up to the end of the line.
Example :

```vhdl
  -- This process models the state register
  process(clock, aresetn)
  begin
    if aresetn = '0' then         -- Active low, asynchronous reset
      state <= IDLE;
    elsif rising_edge(clock) then -- Synchronized on the rising edge of the clock
      state <= next_state;
    end if;
  end process;
```
# Delimited comments

Starting with VHDL 2008, a comment can also extend on several lines.
Multi-lines comments start with `/*` and end with `*/`.
Example :

```vhdl
  /* This process models the state register.
     It has an active low, asynchronous reset
     and is synchronized on the rising edge
     of the clock. */
  process(clock, aresetn)
  begin
    if aresetn = '0' then
      state <= IDLE;
    elsif rising_edge(clock) then
      state <= next_state;
    end if;
  end process;
```

Delimited comments can also be used on less than a line:

```vhdl
  -- Finally, we decided to skip the reset...
  process(clock/*, aresetn*/)
  begin
    /*if aresetn = '0' then
      state <= IDLE;
    els*/if rising_edge(clock) then
      state <= next_state;
    end if;
  end process;
```

# Nested comments

Starting a new comment (single line or delimited) inside a comment (single line or delimited) has no effect and is ignored.
Examples:

```vhdl
-- This is a single-line comment. This second -- has no special meaning.

-- This is a single-line comment. This /* has no special meaning.

/* This is not a
single-line comment.
And this -- has no
special meaning. */

/* This is not a
single-line comment.
And this second /* has no
special meaning. */
```

<!-- vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=0: -->
