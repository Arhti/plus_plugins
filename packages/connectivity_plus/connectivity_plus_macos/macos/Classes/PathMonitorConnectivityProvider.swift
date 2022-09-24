import Foundation
import Network

@available(macOS 10.14, *)
public class PathMonitorConnectivityProvider: NSObject, ConnectivityProvider {

  private let queue = DispatchQueue.global(qos: .background)

  private var _pathMonitor: NWPathMonitor?

  public var currentConnectivityType: ConnectivityType {
    let path = ensurePathMonitor().currentPath
    if path.status == .satisfied {
      if path.usesInterfaceType(.wifi) {
        return .wifi
      } else if path.usesInterfaceType(.cellular) {
        return .cellular
      } else if path.usesInterfaceType(.wiredEthernet) {
        return .wiredEthernet
      }
    }
    return .none
  }

  public var connectivityUpdateHandler: ConnectivityUpdateHandler?

  override init() {
    super.init()
    ensurePathMonitor()
  }

  public func start() {
    ensurePathMonitor()
  }

  public func stop() {
    _pathMonitor?.cancel()
    _pathMonitor = nil
  }

  private func ensurePathMonitor() -> NWPathMonitor {
    if (_pathMonitor == nil) {
      let pathMonitor = NWPathMonitor()
      pathMonitor.start(queue: queue)
      pathMonitor.pathUpdateHandler = pathUpdateHandler
      _pathMonitor = pathMonitor
    }
    return _pathMonitor!
  }

  private func pathUpdateHandler(path: NWPath) {
    connectivityUpdateHandler?(currentConnectivityType)
  }
}
