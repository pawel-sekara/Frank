import Nest


public struct Route {
  /// The handler to perform the request
  public typealias Handler = Void -> ResponseConvertible

  /// The HTTP method to match the route
  let method: String

  /// The match handler
  let match: RequestType -> Handler?

  public init(method: String, match: RequestType -> Handler?) {
    self.method = method
    self.match = match
  }
}
