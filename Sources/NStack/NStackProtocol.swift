import protocol Service.ServiceType
import protocol Service.Container


public protocol NStackProtocol: ServiceType {
    var application: ApplicationProtocol { get set }
}

public class MockNStack: NStackProtocol {

    public var application: ApplicationProtocol

    public init(application: ApplicationProtocol) {
        self.application = application
    }
    
    public static func makeService(for container: Container) throws -> Self {
        fatalError()
    }

}
