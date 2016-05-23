public class ParameterParser {
  var components: [String]

  public init(path: String) {
    let pathComponents = path.characters.split("?").map(String.init)
    
    components = pathComponents.first!.characters.split("/").map(String.init)
    if pathComponents.count > 1 {
        components[components.count - 1].appendContentsOf("?\(pathComponents.last!)")
    }
  }

  public var isEmpty: Bool {
    return components.isEmpty
  }

  /// Returns and removes the next component from the path
  public func shift() -> String? {
    if isEmpty {
      return nil
    }

    return components.removeFirst()
  }
}

public func validateParameter(parser: ParameterParser, _ value: String) -> String? {
    if let parameter = parser.shift() where parameter == value {
        return parameter
    }
    
    return nil
}
