# Device Tailored Compositors with the QtWayland Compositor Framework

## Abstract
In this talk, I will give an introduction into the QtWayland Compositor framework and show how to use it to create a Wayland compositor from scratch. The QtWayland Compositor API is rather new and just got its first stable release with Qt 5.8. It can be used to create Wayland compositors from scratch within only a few hours and completely adapt them to the UI concept of your embedded device. My talk focus on how to use the framework within a complex multi-application automotive scenario.


## Full Text

Wayland is today's standard to perform window compositing on embedded Linux devices. In cars, one typically uses the automotive specific "IVI" protocol extension to talk to the compositor. This works well if you have a UI with only limited window dynamics or animations, like a static display of windows from different processes (e.g. a radio control window, a climate control window...). But of you want to add fancy window animations and/or have a certain complex workflow for your UI in mind, the IVI protocol shows its limits. However, writing your own Wayland compositor is no option in such a case due to the amount of work and the introduced complexity/bugs. In this talk, I will explain why and when the QtWayland Compositor Framework provides you with a new alternative.

The QtWayland Compositor API, which only recently entered the realm of stable released Qt API, makes it almost trivial to create your own Wayland compositor. Even adding your own protocol extensions, for which your UX designers can add any fancy (QtQuick) animation you can dream of, is simple. In my talk, I will give an introduction into the QtWayland Compositor framework and show how to use it to create a Wayland compositor from scratch. I will focus on my own experience from using the framework in real-life automotive scenarios. However, like most people in the embedded world, I cannot directly talk about my projects, but instead will talk about a hypothetical "Kitchen HMI". This Kitchen HMI will feature the following:

- The windows from different example applications (clock app, tea cooking timer app, egg cooking timer app) will be composed in a uniform UI by a QtWayland based Wayland compositor.
- The compositor provides a custom protocol extension for alarming ("hey, your tea is ready!").
- The windows will have nice animations, actually you can handle them the same as QtQuick items in a single process QtQuick application.

Attending the talk will provide you with the required knowledge to do all of the above by your own and specifically show that window handling in a QtWayland compositor "feels" the same like doing simple declarative QtQuick UI development.
