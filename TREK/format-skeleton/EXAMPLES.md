# Trek Language Examples

## Basic Program Structure

```trek
.file(
  TREK filename: =hello.trek=
  TREK runas: =trek=
  1{
    variables {
      is_main = true
      greeting = "Hello, Trek!"
    }
    SECTIONSTART[
      // Main program logic
    ]
  }
)
```

## Drawing Shapes

### Circle

```trek
.draw [ellipse] {
  dimensions {
    radius 20px
  }
  .color [hex-#ff0000] {
    .color_use = .fill
  }
  .pos fromObjCenter(measureAsUnit: percent) {
    -left 50(%)
    -up 50(%)
  }
  object_id [circle1]
}
```

### Rectangle

```trek
.draw [rectangle] {
  dimensions {
    width 100px
    height 50px
  }
  .color [hex-#0000ff] {
    .color_use = .border; .fill
  }
  .pos fromObjCenter(measureAsUnit: percent) {
    -left 25(%)
    -up 75(%)
  }
  object_id [rect1]
}
```

## Styling with Background

```trek
.background {
  .color [hex-#f5f5f5]
}

.draw [ellipse] {
  dimensions {
    radius 15px
  }
  .color [hex-#333333] {
    .color_use = .border
  }
  object_id [dot]
}
```

## Variables and Positioning

```trek
variables {
  circle_x = 50
  circle_y = 50
  circle_size = 20
  color_accent = #ff6b9d
}

.draw [ellipse] {
  dimensions {
    radius circle_size px
  }
  .color [hex-color_accent] {
    .color_use = .fill
  }
  .pos fromObjCenter(measureAsUnit: percent) {
    -left circle_x (%)
    -up circle_y (%)
  }
  object_id [main_circle]
}
```

## Conditional Logic

```trek
function isLarge(size) {
  return size > 50
}

variables {
  object_size = 75
}

if (isLarge(object_size)) {
  .draw [ellipse] {
    dimensions {
      radius 30px
    }
    object_id [large_object]
  }
} else {
  .draw [ellipse] {
    dimensions {
      radius 10px
    }
    object_id [small_object]
  }
}
```

## Looping

```trek
for (let i = 0; i < 5; i++) {
  .draw [ellipse] {
    dimensions {
      radius 10px
    }
    .color [hex-#0099ff]
    .pos fromObjCenter(measureAsUnit: percent) {
      -left (i * 20)(%)
      -up 50(%)
    }
    object_id [circle_i]
  }
}
```

## Modular Design with Classes

```trek
class Button {
  properties {
    width = 100
    height = 40
    color = #007bff
  }
  
  methods {
    render() {
      .draw [rectangle] {
        dimensions {
          width this.width px
          height this.height px
        }
        .color [hex-this.color]
      }
    }
  }
}

let btn = Button {
  width = 150
  height = 50
  color = #0056b3
}

btn.render()
```

## Reusable Components with Import/Export

```trek
// File: button.trek
export const StyledButton = {
  width = 120
  height = 45
  bg_color = #007bff
  text_color = #ffffff
  
  draw() {
    .background {
      .color [hex-#f9f9f9]
    }
    .draw [rectangle] {
      dimensions {
        width 120px
        height 45px
      }
      .color [hex-#007bff] {
        .color_use = .fill
      }
    }
  }
}

// File: app.trek
import { StyledButton } from "button.trek"

variables {
  button_component = StyledButton
}

button_component.draw()
```

## Animation-Ready Animation Values

```trek
variables {
  animation_frame = 0
  animation_speed = 2
  max_radius = 50
}

.draw [ellipse] {
  dimensions {
    radius (animation_frame * animation_speed) px
  }
  .color [hex-#ff3366] {
    .color_use = .fill
  }
  object_id [animated_circle]
}
```

## Complex Layout

```trek
.file(
  TREK filename: =dashboard.trek=
  1{
    variables {
      title = "Trek Dashboard"
      is_main = true
    }
    SECTIONSTART[
      .background {
        .color [hex-#ffffff]
      }
      
      // Header
      .draw [rectangle] {
        dimensions {
          width 100(%)
          height 60px
        }
        .color [hex-#2c3e50] {
          .color_use = .fill
        }
        .pos fromObjCenter(measureAsUnit: percent) {
          -left 50(%)
          -up 97(%)
        }
        object_id [header]
      }
      
      // Content area
      for (let i = 0; i < 3; i++) {
        .draw [rectangle] {
          dimensions {
            width 30(%)
            height 200px
          }
          .color [hex-#ecf0f1] {
            .color_use = .fill
          }
          .pos fromObjCenter(measureAsUnit: percent) {
            -left ((i * 33) + 17)(%)
            -up 50(%)
          }
          object_id [card_i]
        }
      }
    ]
  }
)
```

---

For more examples and documentation, visit [trek-lang.org](https://trek-lang.org)
