import protocol Service.ServiceType
import protocol Service.Container


protocol NStackProtocol: ServiceType {
    var application: ApplicationProtocol { get set }
}

class MockNStack: NStackProtocol {

    var application: ApplicationProtocol

    init(application: ApplicationProtocol) {
        self.application = application
    }
    
    static func makeService(for container: Container) throws -> Self {
        fatalError()
    }

}
