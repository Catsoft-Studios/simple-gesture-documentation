# Introduction

**Simple Gesture** is a Unity plugin that allows developers to easily detect gestures for touch-screen devices in just one line of code. It can be easely integrated in any project, as it works with both C# and UnityScript.

# Getting Started

First of all, you will have to download the package from the [AssetsStore](http://u3d.as/8bb). Once you have dowloaded and imported the assets you will need to configure... no, wait. That's all! :-D

## The SimpleGesture class

If you open the **SimpleGesture** main folder you will see a bunch of folders that contain other folders, with scripts and more scripts. For the moment, just forget about it. All you need to know is that there's a class called SimpleGesture, and this is everything you'll need.

## Hello World!

But let's see how this works. Create a new script and attach it to a **Game Object**. Inside the script, look for the `Awake` method and add the following line of code. This line of code will tell the `SimpleGesture` framework that, everytime a *tap* gesture is detected, call the custom method named `MyMethod`.

``` cs
public void Awake()
{
	SimpleGesture.OnTap(MyMethod);
}
```

All we need to do now is to print a message to check if it works. When testing this, instead of building the app and installing it in an *Android* or an *iOS* device, I would recomment using the [Unity Remote](http://docs.unity3d.com/Manual/UnityRemote4.html) app. It's available for free for both operating systems and it's much faster that waiting to finish the compile/compress/install/execute processes.

``` cs
public void MyMethod()
{
	Debug.log("Yay! I just tapped!");
}
```

**IMPORTANT NOTE!** Don't add the **Simple Gesture** script to any component. This plugin is smart enough to know if other scene scripts are using it. If so, an instance of the plugin's base class is created automatically.

## Methods Overview

**Simple Gesture** has many methods to detect a wide variety of gestures. But there's a common naming convention between all of them.

- **Discrete gestures:** discrete methods are methods that happen once the user has lifted the finger, such as taps, circles, zig-zags, etc. All this methods begin with the **On** prefix: (`OnTap`, `OnSwipe`, ...).
- **Continuous gestures:** These methods deal with gestures that continuously happen while the user moves the finger around the screen. These methods begin with the **While** prefix and a gerund as the gesture verb: (`WhilePanning`, `WhileTwisting`, ...).
- **Stop detection:** Sometimes you will want to stop detecting certain gestures. These methods begin with the **Stop** prefix and replace the **On** or **While** prefix: (`StopTap`, `StopPanning`, ...).

All these methods are described in detail below.

# Tap Gestures

## Methods

**Tap Gestures** are triggered when the user touches the screen and lifts the finger without barely moving.

### OnTap

`OnTap` detects when a finger *clicks* the screen, without taking into acount the time the finger stays on the screen.

``` cs
SimpleGesture.OnTap(MyCallback);
```

###OnShortTap

`OnShortTap` detects when a finger *clicks* the screen, but the time between the first touch and the release of the finger is **less** than 0.5 seconds.

``` cs
SimpleGesture.OnShortTap(MyCallback);
```

###OnLongTap

`OnShortTap` detects when a finger *clicks* the screen, but the time between the first touch and the release of the finger is **greater** than 0.5 seconds.

``` cs
SimpleGesture.OnLongTap(MyCallback);
```

### OnDoubleTap

`OnDoubleTap` detects when a finger *clicks* the screen a second time within a short time span (half a second by default).

``` cs
SimpleGesture.OnDoubleTap(MyCallback);
```

## More information

If you want to know more information about this gesture, simply add a `GestureInfoTap` parameter type at your custom function, and SimpleGesture will provide more information about the gesture detected. In particular, `GestureInfoTap` provides:

```
public class GestureInfoTap {
	public Vector2 position;
	public float duration;
}
```

* **[Vector2] position**: The position of the touch in screen-space.
* **[float] duration**: The duration of the tap (in seconds).

**Example:**

``` cs
public void Awake() {
	SimpleGesture.OnTap(MyTapCallback);
}

public void MyTapCallback(GestureInfoTap gesture) {
	Debug.Log("Tap!");
	Debug.Log("Position:" + gesture.position);
	Debug.Log("Duration:" + gesture.duration);
}
```

# Swipe Gestures

## Generic Swipe

**Swipe Gestures** are triggered after *drawing* a straight line with one finger.

### OnSwipe

`OnSwipe` is triggered when a finger *swipes* in any direction around the screen and after the finger is lifted.

``` cs
SimpleGesture.OnSwipe(MyCallback);
```

## 4 Axis Swipes

4 axis swipes are methods that detect swipes in only 4 directions (up, right, down and left). To decide the direction of the swipe, the space is divided in 4 quadrants, each with an angle of 90º.

![4 Axis Swipe Quadrants](https://raw.githubusercontent.com/Catsoft-Studios/simple-gesture-documentation/master/Media/swipe4axis.png)

### On4AxisSwipeUp

`On4AxisSwipeUp` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On4AxisSwipeUp(MyCallback);
```

### On4AxisSwipeDown

`On4AxisSwipeDown` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On4AxisSwipeDown(MyCallback);
```

### On4AxisSwipeRight

`On4AxisSwipeRight` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On4AxisSwipeRight(MyCallback);
```

### On4AxisSwipeLeft

`On4AxisSwipeLeft` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On4AxisSwipeLeft(MyCallback);
```

## 9 Axis Swipes

9 axis swipes are methods that detect swipes in 8 directions (up, right, down and left and their diagonals). To decide the direction of the swipe, the space is divided in 8 quadrants, each with an angle of 40º and 50º (this last corresponding to the diagonal quadrants).

![9 Axis Swipe Quadrants](https://raw.githubusercontent.com/Catsoft-Studios/simple-gesture-documentation/master/Media/swipe9axis.png)

### On9AxisSwipeUp

`On9AxisSwipeUp` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On9AxisSwipeUp(MyCallback);
```

### On9AxisSwipeDown

`On9AxisSwipeDown` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On9AxisSwipeDown(MyCallback);
```

### On9AxisSwipeRight

`On9AxisSwipeRight` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On9AxisSwipeRight(MyCallback);
```

### On9AxisSwipeLeft

`On9AxisSwipeLeft` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On9AxisSwipeLeft(MyCallback);
```

### On9AxisSwipeDiagonalRightUp

`On9AxisSwipeDiagonalRightUp` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On9AxisSwipeDiagonalRightUp(MyCallback);
```

### On9AxisSwipeDiagonalRightDown

`On9AxisSwipeDiagonalRightDown` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On9AxisSwipeDiagonalRightDown(MyCallback);
```

### On9AxisSwipeDiagonalLeftUp

`On9AxisSwipeDiagonalLeftUp` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On9AxisSwipeDiagonalLeftUp(MyCallback);
```

### On9AxisSwipeDiagonalLeftDown

`On9AxisSwipeDiagonalLeftDown` is triggered when a finger *swipes* up around the screen and after the finger is lifted.

```
SimpleGesture.On9AxisSwipeDiagonalLeftDown(MyCallback);
```

## Flick Swipes

Flick Swipes act like the other swipe methods, but they don't wait for the finger to be lifted. Instead, as soon as the gesture is recognized as a swipe, the flick swipes are triggered.

![Flick Swipe explanation](https://raw.githubusercontent.com/Catsoft-Studios/simple-gesture-documentation/master/Media/flickswipe.png)

### On4AxisFlickSwipeUp

`On4AxisFlickSwipeUp` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On4AxisFlickSwipeUp(MyCallback);
```

### On4AxisFlickSwipeDown

`On4AxisFlickSwipeDown` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On4AxisFlickSwipeDown(MyCallback);
```

### On4AxisFlickSwipeRight

`On4AxisFlickSwipeRight` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On4AxisFlickSwipeRight(MyCallback);
```

### On4AxisFlickSwipeLeft

`On4AxisFlickSwipeLeft` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On4AxisFlickSwipeLeft(MyCallback);
```

### On9AxisFlickSwipeUp

`On9AxisFlickSwipeUp` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On9AxisFlickSwipeUp(MyCallback);
```

### On9AxisFlickSwipeDown

`On9AxisFlickSwipeDown` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On9AxisFlickSwipeDown(MyCallback);
```

### On9AxisFlickSwipeRight

`On9AxisFlickSwipeRight` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On9AxisFlickSwipeRight(MyCallback);
```

### On9AxisFlickSwipeLeft

`On9AxisFlickSwipeLeft` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On9AxisFlickSwipeLeft(MyCallback);
```

### On9AxisFlickSwipeRightUp

`On9AxisFlickSwipeRightUp` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On9AxisFlickSwipeRightUp(MyCallback);
```

### On9AxisFlickSwipeRightDown

`On9AxisFlickSwipeRightDown` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On9AxisFlickSwipeRightDown(MyCallback);
```

### On9AxisFlickSwipeLeftUp

`On9AxisFlickSwipeLeftUp` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On9AxisFlickSwipeLeftUp(MyCallback);
```

### On9AxisFlickSwipeLeftDown

`On9AxisFlickSwipeLeftDown` is triggered when a finger *swipes* up around the screen and as soon as there is enough information to know the gesture is a swipe.

```
SimpleGesture.On9AxisFlickSwipeLeftDown(MyCallback);
```

## More information

If you want to know more information about this gesture, simply add a `GestureInfoSwipe` parameter type at your custom function, and SimpleGesture will provide more information about the gesture detected. In particular, `GestureInfoSwipe` provides:

```
public class GestureInfoSwipe {
	public Vector2 direction;
	public float distance;
	public Vector2 firstPosition;
	public Vector2 endPosition;
}
```

* **[Vector2] direction**: The average normalized direction of the swipe in screen-space.
* **[float] distance**: The distance of the swipe.
* **[Vector2] firstPosition**: The position of this gesture's first touch.
* **[Vector2] lastPosition**: The position of this gesture's last touch.

**Example:**

```
public void Awake() {
	SimpleGesture.On4AxisSwipeLeft(MySwipeLeftCallback);
}

public void MySwipeLeftCallback(GestureInfoSwipe gesture) {
	Debug.Log("Left Swipe!");
	Debug.Log("Direction:" + gesture.direction);
	Debug.Log("distance:" + gesture.distance);
}
```

# Shape Gestures

## Methods

**Shape Gestures** are triggered when SimpleGesture detects a certain shape *drawn* with the finger.

### OnCircle

`OnCircle` detects when a finger *draws* a circle on the touch-screen.

``` cs
SimpleGesture.OnCircle(MyCallback);
```

###OnZigZag

`OnZigZag` detects when a finger *draws* a zig-zag on the touch-screen of at least 3 edges.

``` cs
SimpleGesture.OnZigZag(MyCallback);
```

## More information

If you want to know more information about this gesture, simply add a `GestureInfoCircle`/`GestureInfoZigZag` parameter type at your custom function, and SimpleGesture will provide more information about the gesture detected. In particular, `GestureInfoCircle` provides:

```
public class GestureInfoCircle {
	public Vector2 center;
	public float radius;
}
```

* **[Vector2] center**: The average center of the circle drawn in screen-space.
* **[float] radius**: The average radius of the circle drawn in screen-space.

**Example:**

``` cs
public void Awake() {
	SimpleGesture.OnCircle(MyCircleCallback);
}

public void MyCircleCallback(GestureInfoCircle gesture) {
	Debug.Log("Circle!");
	Debug.Log("Center:" + gesture.center);
	Debug.Log("Radius:" + gesture.radius);
}
```

And `GestureInfoZigZag` provides:

```
public class GestureInfoZigZag {
	public Vector2 direction;
	public float distance;
}
```

* **[Vector2] direction**: The average direction of the zig-zag drawn.
* **[float] distance**: The distance of the zig-zag.

**Example:**

``` cs
public void Awake() {
	SimpleGesture.OnZigZag(MyZigZagCallback);
}

public void MyZigZagCallback(GestureInfoZigZag gesture) {
	Debug.Log("ZigZag!");
	Debug.Log("Direction:" + gesture.direction);
	Debug.Log("Distance:" + gesture.distance);
}
```

# Continuous Gestures

## Methods

**Continuous Gestures** are triggered constantly as long as the finger/s is/are moving. For example, panning is a continuous gesture, because it is triggered while the finger is moving, and not when the finger is lifted (it wouldn't make any sense).

### While1FingerPanning

`While1FingerPanning` detects when a finger moves around the screen.

``` cs
SimpleGesture.While1FingerPanning(MyCallback);
```

###WhilePanning

`WhilePanning` detects when 2 or more fingers move together around the screen.

``` cs
SimpleGesture.WhilePanning(MyCallback);
```

###WhilePinching

`WhilePinching` detects when 2 fingers pinch the screen (zoom out).

``` cs
SimpleGesture.WhilePinching(MyCallback);
```

###WhileStretching

`WhileStretching` detects when 2 fingers stretch the screen (zoom in).

``` cs
SimpleGesture.WhileStretching(MyCallback);
```

###WhileTwisting

`WhileTwisting` detects when 2 fingers rotate around a pivot.

``` cs
SimpleGesture.WhileTwisting(MyCallback);
```

## More information

If you want to know more information about this gesture, simply add a `GestureInfoPan` / `GestureInfoZoom` / `GestureInfoTwist` parameter type at your custom function, and SimpleGesture will provide more information about the gesture detected.

In particular, `GestureInfoPan`, from `While1FingerPanning` and `WhilePanning` provides:

```
public class GestureInfoPan {
	public Vector2 deltaDirection;
}
```

* **[Vector2] deltaDirection**: The direction (and amount of movement) of the panning since the last event fired. No need to multiply by Time.deltaTime, as it's already frame-based.

**Example:**

``` cs
public void Awake() {
	SimpleGesture.WhilePanning(MyPanCallback);
}

public void MyPanCallback(GestureInfoPan gesture) {
	Debug.Log("Panning!");
	Debug.Log("movement:" + gesture.deltaDirection);
}
```

On the other hand, `WhilePinching` and `WhileStretching` provide the following class info:

```
public class GestureInfoZoom {
	public float deltaDistance;
	public Vector2 center;
	public Vector2 position1;
	public Vector2 position2;
}
```

* **[float] deltaDistace**: The amount of distance movemtn since the last zoom event. No need to multiply by Time.deltaTime, as it's already frame-based.
* **[Vector2] center**: The pivot where the zoom focuses.
* **[Vector2] position1**: The position of finger 1.
* **[Vector2] position2**: The position of finger 2.

**Example:**

``` cs
public void Awake() {
	SimpleGesture.WhilePinching(MyZoomCallback);
}

public void MyZoomCallback(GestureInfoZoom gesture) {
	Debug.Log("Pinching!");
	Debug.Log("Center:" + gesture.center);
}
```

And for the `WhileTwisting` detector, the information retrieved is:

```
public class GestureInfoTwist {
	public float deltaDistance;
	public Vector2 center;
	public Vector2 position1;
	public Vector2 position2;
	public bool clockwise;
}
```

* **[float] deltaDistace**: The amount of distance movemtn since the last zoom event. No need to multiply by Time.deltaTime, as it's already frame-based.
* **[Vector2] center**: The pivot where the zoom focuses.
* **[Vector2] position1**: The position of finger 1.
* **[Vector2] position2**: The position of finger 2.
* **[bool] clockwise**: Whether the twisiting is clockwise (true) or counter-clockwise (false).

**Example:**

``` cs
public void Awake() {
	SimpleGesture.WhileTwisting(MyTwistCallback);
}

public void MyTwistCallback(GestureInfoTwist gesture) {
	Debug.Log("Twisting!");
	Debug.Log("Center:" + gesture.center);
	Debug.Log("Is Clockwise?:" + gesture.clockwise);
}
```