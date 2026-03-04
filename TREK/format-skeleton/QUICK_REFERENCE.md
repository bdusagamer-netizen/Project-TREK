# Trek Quick Reference

## File Structure

A typical Trek program:

```trek
.file(
  TREK filename: =program.trek=
  TREK runas: =trek=
  1{
    variables { /* declarations */ }
    SECTIONSTART[
      /* code */
    ]
  }
)
```

## Data Types

| Type | Example | Description |
|------|---------|-------------|
| Number | `42`, `3.14` | Integer or floating-point |
| String | `"hello"` | Text in double quotes |
| Boolean | `true`, `false` | Logical values |
| Hex Color | `#ff0000` | RGB color notation |
| Percentage | `50%` | Percentage unit |
| Pixels | `20px` | Pixel unit |

## Variables

```trek
variables {
  name = "value"
  count = 42
  is_active = true
  color = #ffffff
}
```

## Keywords

### Control Flow
- `if` / `else` - Conditional execution
- `for` - Loop with counter
- `while` - Condition-based loop
- `break` - Exit loop
- `continue` - Skip to next iteration
- `return` - Return from function

### Declarations
- `function` - Define function
- `class` - Define class
- `const` - Constant variable
- `let` - Block-scoped variable
- `var` - Function-scoped variable

### Modules
- `import` - Import from module
- `export` - Export for module use
- `from` - Import source
- `as` - Import alias

### Literals
- `true`, `false` - Boolean values
- `null` - Null value
- `undefined` - Undefined value

## Comments

```trek
// Single line comment
/* Multi-line
   comment */
```

## Drawing Elements

### Basic Shape

```trek
.draw [ellipse] {
  dimensions {
    radius 20px
  }
  .color [hex-#0000ff] {
    .color_use = .fill
  }
}
```

### With Positioning

```trek
.pos fromObjCenter(measureAsUnit: percent) {
  -left 50(%)
  -up 75(%)
}
```

### With ID

```trek
object_id [my_element]
```

## Functions

```trek
function add(a, b) {
  return a + b
}

let result = add(5, 3)  // result = 8
```

## Classes

```trek
class Point {
  properties {
    x = 0
    y = 0
  }
  
  methods {
    distance() {
      return sqrt(x * x + y * y)
    }
  }
}

let p = Point { x = 3, y = 4 }
```

## Operators

### Arithmetic
- `+` Addition
- `-` Subtraction
- `*` Multiplication
- `/` Division
- `%` Modulus

### Comparison
- `==` Equal
- `!=` Not equal
- `===` Strict equal
- `!==` Strict not equal
- `<` Less than
- `>` Greater than
- `<=` Less or equal
- `>=` Greater or equal

### Logical
- `&&` AND
- `||` OR
- `!` NOT

### Other
- `=` Assignment
- `?` / `:` Ternary operator

## Control Structures

### If Statement

```trek
if (condition) {
  // true branch
} else if (other_condition) {
  // another branch
} else {
  // else branch
}
```

### For Loop

```trek
for (let i = 0; i < 10; i++) {
  // loop body
}
```

### While Loop

```trek
while (condition) {
  // loop body
}
```

## Import/Export

```trek
// Export
export const Button = { ... }
export function calculate(x) { ... }

// Import
import { Button, calculate } from "module"
import * as Module from "module"
import Component from "module"
```

## Built-in Elements

- `.file()` - Program wrapper
- `.background` - Set background
- `.color` - Color definition
- `.draw` - Draw shape
- `.border` - Border styling
- `.fill` - Fill styling
- `.pos` - Position element
- `variables` - Variable block
- `dimensions` - Dimensions block
- `object_id` - Unique identifier

## Common Patterns

### Conditional Draw

```trek
if (should_draw) {
  .draw [rectangle] { ... }
}
```

### Loop Drawing

```trek
for (let i = 0; i < count; i++) {
  .draw [ellipse] {
    object_id [circle_i]
  }
}
```

### Component Function

```trek
function DrawButton(label) {
  .draw [rectangle] {
    dimensions {
      width 100px
      height 40px
    }
  }
}

DrawButton("Click Me")
```

---

For more information, see [LANGUAGE_SPEC.md](LANGUAGE_SPEC.md) and [EXAMPLES.md](EXAMPLES.md)
