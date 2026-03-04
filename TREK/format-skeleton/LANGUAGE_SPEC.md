# Trek Language Specification

## Overview

Trek is a modern coding language designed for declarative programming with a focus on visual elements, styling, and hierarchical structure. It combines data definition, functional programming, and visual layout capabilities.

## File Extension

- `.trek`

## Basic Syntax

### Comments

```trek
// Single-line comment
/* Multi-line
   comment */
```

### Variables and Assignment

```trek
variables {
  is_main = true
  is_functions = false
  count = 42
  name = "example"
}
```

### Data Types

Trek supports the following data types:

- **Boolean**: `true`, `false`
- **Number**: Integer (e.g., `42`) or floating-point (e.g., `3.14`)
- **String**: Quoted text (e.g., `"hello"`, `'world'`)
- **Hexadecimal**: Color notation (e.g., `#ffffff`)
- **Percentage**: Unit notation (e.g., `50%`)
- **Pixels**: Unit notation (e.g., `20px`)

### Sections

Trek programs are organized into numbered sections:

```trek
.file(
  TREK filename: =example.trek=
  1{
    variables { ... }
    content { ... }
  }
)
```

### Styling and Drawing

Trek supports visual element definition:

```trek
.background {
  .color [hex-#ffffff]
}

.draw [ellipse] {
  dimensions {
    radius 20px
  }
  .color [hex-#484848] {
    .color_use = .border; .fill
  }
}
```

### Positioning

Elements can be positioned relative to other objects:

```trek
.pos fromObjCenter(measureAsUnit: percent) {
  -left 50(%)
  -right 50(%)
  -up 90(%)
}
```

### Functions and Objects

```trek
function calculateArea(width, height) {
  return width * height
}

class Shape {
  properties {
    width = 0
    height = 0
  }
}
```

### Operators

Trek supports standard operators:

- **Arithmetic**: `+`, `-`, `*`, `/`, `%`
- **Comparison**: `==`, `!=`, `===`, `!==`, `<`, `>`, `<=`, `>=`
- **Logical**: `&&`, `||`, `!`
- **Conditional**: `?`, `:`

### Control Flow

```trek
if (condition) {
  // do something
} else {
  // do something else
}

for (let i = 0; i < 10; i++) {
  // loop body
}

while (condition) {
  // loop body
}
```

### Imports and Exports

```trek
import { Component } from "module"
export const MyComponent = {...}
```

## Key Built-in Elements

- `.file()` - File definition wrapper
- `.background` - Background styling
- `.color` - Color definition
- `.draw` - Draw element (shapes: ellipse, rectangle, etc.)
- `.border` - Border styling
- `.fill` - Fill styling
- `.pos` - Position definition
- `variables` - Variable block
- `dimensions` - Dimensions block

## Example Program

```trek
.file(
  TREK filename: =demo.trek=
  1{
    variables {
      is_main = true
      bg_color = #f0f0f0
      title = "My Trek App"
    }
    SECTIONSTART[
      .background {
        .color [hex-#ffffff]
      }
      .draw [ellipse] {
        dimensions {
          radius 20px
        }
        .color [hex-#484848] {
          .color_use = .border; .fill
        }
        .pos fromObjCenter(measureAsUnit: percent) {
          -left 50(%)
          -up 90(%)
        }
        object_id [ball]
      }
    ]
  }
)
```

## Reserved Keywords

- `if`, `else`, `for`, `while`, `break`, `continue`
- `function`, `class`, `const`, `let`, `var`
- `return`, `import`, `export`, `from`, `as`
- `true`, `false`, `null`, `undefined`

## Version History

- **v1.0.0** (2026-03-04) - Initial language specification

---

For more information, visit the Trek project repository.
