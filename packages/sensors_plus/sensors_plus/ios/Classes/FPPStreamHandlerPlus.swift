// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import Foundation
import Flutter
import UIKit
import CoreMotion

let GRAVITY = 9.81
var _motionManager: CMMotionManager!

func _initMotionManager() {
    if (_motionManager == nil) {
        _motionManager = CMMotionManager()
    }
}

func sendTriplet(x: Float64, y: Float64, z: Float64, sink: FlutterEventSink) {
    if _isCleanUp {
        return
    }
    // Even after [detachFromEngineForRegistrar] some events may still be received
    // and fired until fully detached.
    let triplet = [x, y, z];
    triplet.withUnsafeBufferPointer { buffer in
        sink(FlutterStandardTypedData.init(float64: Data(buffer: buffer)))
    }
}

class FPPAccelerometerStreamHandlerPlus: NSObject, FlutterStreamHandler {

    func onListen(
            withArguments arguments: Any?,
            eventSink sink: @escaping FlutterEventSink
    ) -> FlutterError? {
        _initMotionManager()
        _motionManager.startAccelerometerUpdates(to: OperationQueue()) { data, error in
            if _isCleanUp {
                return
            }
            if (error != nil) {
                sink(FlutterError.init(
                        code: "UNAVAILABLE",
                        message: error!.localizedDescription,
                        details: nil
                ))
                return
            }
            // Multiply by gravity, and adjust sign values to
            // align with Android.
            let acceleration = data!.acceleration
            sendTriplet(
                    x: -acceleration.x * GRAVITY,
                    y: -acceleration.y * GRAVITY,
                    z: -acceleration.z * GRAVITY,
                    sink: sink
            )
        }
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        _motionManager.stopAccelerometerUpdates()
        return nil
    }

    func dealloc() {
        FPPSensorsPlusPlugin._cleanUp()
    }
}

class FPPUserAccelStreamHandlerPlus: NSObject, FlutterStreamHandler {

    func onListen(
            withArguments arguments: Any?,
            eventSink sink: @escaping FlutterEventSink
    ) -> FlutterError? {
        _initMotionManager()
        _motionManager.startDeviceMotionUpdates(to: OperationQueue()) { data, error in
            if _isCleanUp {
                return
            }
            if (error != nil) {
                sink(FlutterError.init(
                        code: "UNAVAILABLE",
                        message: error!.localizedDescription,
                        details: nil
                ))
                return
            }
            // Multiply by gravity, and adjust sign values to
            // align with Android.
            let acceleration = data!.userAcceleration
            sendTriplet(
                    x: -acceleration.x * GRAVITY,
                    y: -acceleration.y * GRAVITY,
                    z: -acceleration.z * GRAVITY,
                    sink: sink
            )
        }
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        _motionManager.stopDeviceMotionUpdates()
        return nil
    }

    func dealloc() {
        FPPSensorsPlusPlugin._cleanUp()
    }
}

class FPPGyroscopeStreamHandlerPlus: NSObject, FlutterStreamHandler {

    func onListen(
            withArguments arguments: Any?,
            eventSink sink: @escaping FlutterEventSink
    ) -> FlutterError? {
        _initMotionManager()
        _motionManager.startGyroUpdates(to: OperationQueue()) { data, error in
            if _isCleanUp {
                return
            }
            if (error != nil) {
                sink(FlutterError(
                        code: "UNAVAILABLE",
                        message: error!.localizedDescription,
                        details: nil
                ))
                return
            }
            let rotationRate = data!.rotationRate
            sendTriplet(x: rotationRate.x, y: rotationRate.y, z: rotationRate.z, sink: sink)
        }
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        _motionManager.stopGyroUpdates()
        return nil
    }

    func dealloc() {
        FPPSensorsPlusPlugin._cleanUp()
    }
}

class FPPMagnetometerStreamHandlerPlus: NSObject, FlutterStreamHandler {

    func onListen(
            withArguments arguments: Any?,
            eventSink sink: @escaping FlutterEventSink
    ) -> FlutterError? {
        _initMotionManager()
        // Allow iOS to present calibration interaction.
        _motionManager.showsDeviceMovementDisplay = true
        _motionManager.startDeviceMotionUpdates(
                // https://developer.apple.com/documentation/coremotion/cmattitudereferenceframe?language=objc
                // "Using this reference frame may require device movement to
                // calibrate the magnetometer," which is desired to ensure the
                // DeviceMotion actually has updated, calibrated geomagnetic data.
                using: CMAttitudeReferenceFrame.xMagneticNorthZVertical,
                to: OperationQueue()
        ) { data, error in
            if _isCleanUp {
                return
            }
            if (error != nil) {
                sink(FlutterError(
                        code: "UNAVAILABLE",
                        message: error!.localizedDescription,
                        details: nil
                ))
                return
            }
            // The `magneticField` is a
            // CMCalibratedMagneticField.
            let magneticField = data!.magneticField.field
            sendTriplet(x: magneticField.x, y: magneticField.y, z: magneticField.z, sink: sink)
        }
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        _motionManager.stopDeviceMotionUpdates()
        return nil
    }

    func dealloc() {
        FPPSensorsPlusPlugin._cleanUp()
    }
}
