# twilio-video-ios-capacitor

[![npm](https://img.shields.io/npm/v/twilio-video-ios-capacitor.svg)](https://www.npmjs.com/package/twilio-video-ios-capacitor)
[![npm](https://img.shields.io/npm/dt/twilio-video-ios-capacitor.svg?label=npm%20downloads)](https://www.npmjs.com/package/twilio-video-ios-capacitor)

Capacitor plugin for make video calls using [Twilio Video](https://www.twilio.com/video) platform on iOS.  

Since the current implementation of Ionic/PWA apps on iOS run on top of WKWebView and Apple does not support WebRTC on WKWebView, the only way to work with Twilio Video on this platform is to build it natively.

> This plugin is currently under development.  
> Forked from [twilio-ios-capacitor](https://github.com/MCanhisares/twilio-ios-capacitor).

## Installation

### NPM

* `npm i twilio-video-ios-capacitor`

### Yarn

* `yarn add twilio-video-ios-capacitor`

## Usage

This plugin uses the Twilio Video iOS Library and uses version 2.4 of Capacitor

```ts
import { Plugins } from '@capacitor/core';
const { TwilioVideoIos } = Plugins

. . .
// to connect
await TwilioVideoIos.joinRoom({ roomName: roomName, accessToken: accessToken})
// to close connection:
await TwilioVideoIos.disconnect()


// to get a disconnect event was clicked on the native side
window.addEventListener('TwilioVideoIosCapacitor:disconnect', () => {
  history.back();
});
. . .
```

## Api

| Method                                               | Type                     | Description                 |
| ---------------------------------------------------- |------------------------- | --------------------------- |
| joinRoom(options: { roomName: string, accessToken: string }) | `Promise<void>` | Used to join a room with the provided accessToken |
