# Introduction

**Simple Gesture** is a Unity plugin that allows developers to easily detect gestures for touch-screen devices in just one line of code. It can be easely integrated in any project, as it works with both C# and UnityScript.

# Getting Started

First of all, you will have to download the package from the [AssetsStore](http://u3d.as/8bb). Once you have dowloaded and imported the assets you will need to configure... no, wait. That's all! :-D

# Using SimpleGesture class

If you open the *SimpleGesture* main folder you will see a bunch of folders that contain other folders, with scripts and more scripts. For the moment, just forget about it. All you need to know is that there's a class called SimpleGesture, and this is everything you'll need.

## Hello World!

But let's see how this works. Create a new script and attach it to a **Game Object**. Inside the script, look for the Awake method and add the following line of code. This line of code will tell the SimpleGesture framework that, everytime a *tap* gesture is detected, call the method named **MyMethod**.

``` cs
public void Awake()
{
	SimpleGesture.OnTap(MyMethod);
}
```

All we need to do now is to print a message to check if it works. When testing this, instead of building the app and installing it in an Android or an iOS device, I would recomment using the [Unity Remote](http://docs.unity3d.com/Manual/UnityRemote4.html) app. It's available for free for both operating systems and it's much faster that waiting to finish the compile/compress/install/execute processes.

``` cs
public void MyMethod()
{
	Debug.log("Yay! I just tapped!");
}
```