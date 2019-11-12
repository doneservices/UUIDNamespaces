import XCTest
import UUIDNamespaces

final class UUIDNamespacesTests: XCTestCase {
    func testV3() {
        XCTAssertEqual(
            UUID(name: "hello.example.com", namespace: UUID.DNS, version: .v3),
            UUID(uuidString: "9125a8dc-52ee-365b-a5aa-81b0b3681cf6")!
        )

        XCTAssertEqual(
            UUID(name: "http://example.com/hello", namespace: UUID.URL, version: .v3),
            UUID(uuidString: "c6235813-3ba4-3801-ae84-e0a6ebb7d138")!
        )

        XCTAssertEqual(
            UUID(name: "hello", namespace: UUID(uuidString: "0f5abcd1-c194-47f3-905b-2df7263a084b")!, version: .v3),
            UUID(uuidString: "a981a0c2-68b1-35dc-bcfc-296e52ab01ec")!
        )
    }

    func testV5() {
        XCTAssertEqual(
            UUID(name: "hello.example.com", namespace: UUID.DNS),
            UUID(uuidString: "fdda765f-fc57-5604-a269-52a7df8164ec")!
        )

        XCTAssertEqual(
            UUID(name: "http://example.com/hello", namespace: UUID.URL),
            UUID(uuidString: "3bbcee75-cecc-5b56-8031-b6641c1ed1f1")!
        )

        XCTAssertEqual(
            UUID(name: "hello", namespace: UUID(uuidString: "0f5abcd1-c194-47f3-905b-2df7263a084b")!),
            UUID(uuidString: "90123e1c-7512-523e-bb28-76fab9f2f73d")!
        )
    }

    static var allTests = [
        ("testV3", testV3),
        ("testV5", testV5),
    ]
}
