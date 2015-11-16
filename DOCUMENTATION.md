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

## Methods Overview

**Simple Gesture** has many methods to detect a wide variety of gestures. But there's a common naming convention between all of them.

- **Discrete gestures:** discrete methods are methods that happen once the user has lifted the finger, such as taps, circles, zig-zags, etc. All this methods begin with the **On** prefix: (`OnTap`, `OnSwipe`, ...).
- **Continuous gestures:** These methods deal with gestures that continuously happen while the user moves the finger around the screen. These methods begin with the **While** prefix and a gerund as the gesture verb: (`WhilePanning`, `WhileTwisting`, ...).
- **Stop detection:** Sometimes you will want to stop detecting certain gestures. These methods begin with the **Stop** prefix: (`StopTap`, `StopPanning`, ...).

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