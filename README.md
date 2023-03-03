# shexpand.lua

Expand a string into a table of strings using shell brace expansion.

## Installation

```bash
luarocks install shexpand
```

## Usage

```lua
local shexpand = require('shexpand')

shexpand.expand('a.{js,ts}')
shexpand.expand('{spec,test}.{js,ts}')
shexpand.expand('hi.gz{,ip}')
```
