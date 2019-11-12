# UUIDNamespaces

Namespace extensions for the built-in UUID class.

## Installation

Install using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/doneservices/UUIDNamespaces", from: "1.0.0"),
]
```

## API

### `UUID(name: String, namespace: UUID) -> UUID`

Generate a new UUID version 5 with the specified name and namespace.

### `UUID(name: String, namespace: UUID, version: .v3) -> UUID`

Generate a new UUID version 3 with the specified name and namespace.
