import NStack
import Vapor
import Async


public class MockNStackTranslateController: TranslateControllerProtocol {
    
    public func get(on worker: Container, platform: TranslateController.Platform?, language: String?, section: String, key: String, searchReplacePairs: [String : String]?) -> EventLoopFuture<String> {
        EmbeddedEventLoop().newSucceededFuture(result: section + "-" + key)
    }
    public func get(on worker: Container, section: String, key: String) -> EventLoopFuture<String> {
        EmbeddedEventLoop().newSucceededFuture(result: section + "-" + key)
    }
    
    public func get(on worker: Container, section: String) -> EventLoopFuture<[String : String]> {
        EmbeddedEventLoop().newSucceededFuture(result: [section: section])
    }
    
    public func get(on worker: Container, platform: TranslateController.Platform?, language: String?, section: String) -> EventLoopFuture<[String : String]> {
        EmbeddedEventLoop().newSucceededFuture(result: [section: section])
    }
    
    public func preloadLocalization(on worker: Container) throws -> EventLoopFuture<Void> {
        EmbeddedEventLoop().newSucceededFuture(result: Void())
    }
    
    public func preloadLocalization(on worker: Container, platform: TranslateController.Platform?, language: String?) throws -> EventLoopFuture<Void> {
        EmbeddedEventLoop().newSucceededFuture(result: Void())
    }
    
}

public class MockNStackResponseController: ResponseControllerProtocol {
    
    enum Error: Swift.Error {
        case notImplemented
    }
    
    public subscript(id: Int) -> EventLoopFuture<Response> {
        EmbeddedEventLoop().newFailedFuture(error: Error.notImplemented)
    }
    
    public subscript<T>(id: Int) -> EventLoopFuture<T> where T : Decodable {
        EmbeddedEventLoop().newFailedFuture(error: Error.notImplemented)
    }
    
}


public class MockNStackApplication: ApplicationProtocol {
    
    public var translate: TranslateControllerProtocol
    
    public var response: ResponseControllerProtocol
    
    init() {
        translate = MockNStackTranslateController()
        response = MockNStackResponseController()
    }
    
}


public class MockNStack: NStackProtocol {
    
    public var application: ApplicationProtocol

    public required init() {
        application = MockNStackApplication()
    }
    
    public static func makeService(for container: Container) throws -> Self {
        .init()
    }

}
