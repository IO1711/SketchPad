# SketchPad

SketchPad is a simple drawing app built with SwiftUI. Draw freehand strokes, adjust the brush, and save sketches to view later.

## Features

- Draw on a canvas with touch or pointer input.
- Choose a brush color and set its thickness from 0 to 10.
- Undo, redo, or clear the current drawing.
- Save drawings locally with SwiftData and browse them in the **Show** tab.

## Requirements

- Xcode with the iOS 27 SDK
- An iOS 27 or later device or simulator

The project has no third-party package dependencies.

## Run the app

1. Open `SketchPad.xcodeproj` in Xcode.
2. Select the **SketchPad** scheme and an iOS device or simulator.
3. Press **Run** (⌘R).

To run on a physical device, select your development team in the target's **Signing & Capabilities** settings.

## Using SketchPad

- **Sketch:** Draw on the canvas. Use the color picker and slider to change the brush, or use **Undo**, **Redo**, **Clear**, and **Save** below the canvas.
- **Brush:** Adjust the same brush settings from a dedicated tab.
- **Show:** View drawings saved on this device.

## How it works

SwiftUI `Canvas` renders each stroke from its recorded points and brush style. A shared `Brush` object keeps the color and thickness in sync between tabs. Saved `Drawing` models are stored locally with SwiftData.
