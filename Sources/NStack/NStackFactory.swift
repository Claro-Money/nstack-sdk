import protocol Vapor.ServiceFactory
import protocol Vapor.Container


struct NStackFactory: ServiceFactory {
    
    let cacheFactory: NStackProvider.CacheFactory
    
    var serviceType: Any.Type {
        return NStackProtocol.self
    }
    
    var serviceSupports: [Any.Type] {
        return [NStackProtocol.self]
    }
    
    func makeService(for worker: Container) throws -> Any {
        return try NStack(
            on: worker,
            cacheFactory: cacheFactory
        )
    }
    
    init(cacheFactory: @escaping NStackProvider.CacheFactory) {
        self.cacheFactory = cacheFactory
    }
    
}
