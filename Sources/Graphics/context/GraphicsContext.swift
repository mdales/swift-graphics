import Utils

/** A stateful 2D drawing environment. */
public protocol GraphicsContext {
    associatedtype Image: Sized
    associatedtype SVG: Sized

    /** Creates a new context with the given width and height. */
    init(width: Int, height: Int) throws

    /** Creates an image from this context. */
    func makeImage() throws -> Image

    /** Flushes the changes to the underlying graphics. */
    func flush()

    /** Pushes the current context's state onto an internal stack. */
    func save()

    /** Pops the last state from the internal stack and restores it. */
    func restore()

    /** Applies a translation by the given offset to this context. */
    func translate(by offset: Vec2<Double>)

    /** Applies a rotation by the given angle to this context. */
    func rotate(by angle: Double)

    /** Draws the given line segment to this context. */
    func draw(line: LineSegment<Double>)

    /** Draws the given rectangle to this context. */
    func draw(rect: Rectangle<Double>)

    /** Draws the given ellipse to this context. */
    func draw(ellipse: Ellipse<Double>)

    /** Draws the given image to this context. */
    func draw(image: Image, at position: Vec2<Double>, withSize size: Vec2<Int>, rotation: Double?)

    /** Draws the given SVG to this context. */
    func draw(svg: SVG, at position: Vec2<Double>, withSize size: Vec2<Int>, rotation: Double?)

    /** Draws the given text to this context. */
    func draw(text: Text)
}

public extension GraphicsContext {
    func draw(image: Image) {
        draw(image: image, at: Vec2(x: 0, y: 0))
    }

    func draw(image: Image, at position: Vec2<Double>) {
        draw(image: image, at: position, withSize: image.size)
    }

    func draw(image: Image, at position: Vec2<Double>, rotation: Double?) {
        draw(image: image, at: position, withSize: image.size, rotation: rotation)
    }

    func draw(image: Image, at position: Vec2<Double>, withSize size: Vec2<Int>) {
        draw(image: image, at: position, withSize: size, rotation: nil)
    }

    func draw(svg: SVG) {
        draw(svg: svg, at: Vec2(x: 0, y: 0))
    }

    func draw(svg: SVG, at position: Vec2<Double>) {
        draw(svg: svg, at: position, withSize: svg.size)
    }

    func draw(svg: SVG, at position: Vec2<Double>, rotation: Double?) {
        draw(svg: svg, at: position, withSize: svg.size, rotation: rotation)
    }

    func draw(svg: SVG, at position: Vec2<Double>, withSize size: Vec2<Int>) {
        draw(svg: svg, at: position, withSize: size, rotation: nil)
    }
}
