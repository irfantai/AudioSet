import Flutter
import UIKit

public class SwiftAudiosetPlugin: NSObject, FlutterPlugin {
    
    private var avPlayer: AVPlayer!
    private var avPlayerItem: AVPlayerItem!
    private var isReadyToPlay = false

    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "audioset", binaryMessenger: registrar.messenger())
        let instance = SwiftAudiosetPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        switch(call.method) {
        case "play":
            let arguments = call.arguments as! NSDictionary
           
            
        case "resume":
            self.resume()
            
        case "pause":
            self.pause()
            
        case "stop":
            self.stop()
            
            
        case "dragVolume":
            let arguments = call.arguments as! NSDictionary
            let dragPoint =  arguments["dragPoint"] as! Int
        
            
         case "muteVolume":
           self.volum
        default:
            self.log(message: "Unknown method called on Native Audio Player channel.")
        }
    }
    
    
    func changeToSpeaker() -> Bool{
        try? AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        return true;
    }
    
    func changeToReceiver() -> Bool{
        return changeByPortType([AVAudioSession.Port.builtInMic])
    }
    
    func changeToHeadphones() -> Bool{
        return changeByPortType([AVAudioSession.Port.headsetMic])
    }
    

    func getCurrentPort(){
        return changeByPortType([AVAudioSession.Port.headsetMic])
    }
    
    func changeByPortType(_ ports:[AVAudioSession.Port]) -> Bool{
        let currentRoute = AVAudioSession.sharedInstance().currentRoute
        for output in currentRoute.outputs {
            if(ports.firstIndex(of: output.portType) != nil){
                return true;
            }
        }
        if let inputs = AVAudioSession.sharedInstance().availableInputs {
            for input in inputs {
                if(ports.firstIndex(of: input.portType) != nil){
                    try?AVAudioSession.sharedInstance().setPreferredInput(input);
                    return true;
                }
            }
        }
        return false;
    }
}
