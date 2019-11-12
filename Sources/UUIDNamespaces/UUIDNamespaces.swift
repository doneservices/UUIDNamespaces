import Foundation
import CommonCrypto

fileprivate extension Data {
    func md5() -> [UInt8] {
        let ns = self as NSData
        var digest = [UInt8](repeating: 0, count:Int(CC_MD5_DIGEST_LENGTH))
        _ = CC_MD5(ns.bytes, CC_LONG(ns.count), &digest)
        return digest
    }

    func sha1() -> [UInt8] {
        let ns = self as NSData
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        _ = CC_SHA1(ns.bytes, CC_LONG(ns.count), &digest)
        return digest
    }
}

fileprivate extension UUID {
    var bytes: Data {
        return withUnsafeBytes(of: self.uuid) {
            Data(bytes: $0.baseAddress!, count: $0.count)
        }
    }
}

public enum UUIDNamespaceVersion {
    case v3
    case v5
}

fileprivate extension UUIDNamespaceVersion {
    var versionBits: UInt8 {
        switch self {
        case .v3: return 0x30
        case .v5: return 0x50
        }
    }
}

public extension UUID {
    // Pre-defined namespaces, per Appendix C
    static let DNS = UUID(uuidString: "6ba7b810-9dad-11d1-80b4-00c04fd430c8")!
    static let URL = UUID(uuidString: "6ba7b811-9dad-11d1-80b4-00c04fd430c8")!

    init(name: String, namespace: UUID, version: UUIDNamespaceVersion = .v5) {
        var data = Data()

        data.append(contentsOf: namespace.bytes)
        data.append(contentsOf: name.utf8)

        var digest: [UInt8]

        switch version {
        case .v3: digest = data.md5()
        case .v5: digest = data.sha1()
        }

        // Set version bits:
        digest[6] &= 0x0F
        digest[6] |= version.versionBits

        // Set variant bits:
        digest[8] &= 0x3F
        digest[8] |= 0x80

        self = NSUUID(uuidBytes: digest) as UUID
    }
}
