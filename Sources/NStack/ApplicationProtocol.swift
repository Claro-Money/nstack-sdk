public protocol ApplicationProtocol {
    var translate: TranslateControllerProtocol { mutating get }
    var response: ResponseControllerProtocol { mutating get }
}
