import protocol Service.ServiceType
import protocol Service.Container


public protocol NStackProtocol: ServiceType {
    var application: ApplicationProtocol { get set }
}

