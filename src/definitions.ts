declare global {
  interface PluginRegistry {
    TwilioVideoIos?: TwilioVideoIos;
  }
}

export interface TwilioVideoIos {
  joinRoom(options: {roomName: String, accessToken: String}): Promise<any>;  
}
