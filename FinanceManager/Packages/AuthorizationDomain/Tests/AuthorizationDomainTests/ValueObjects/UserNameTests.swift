import Testing
@testable import AuthorizationDomain

@Suite
struct UserNameTests {
    @Test("Successful init")
    func init_with_valid_value() async throws {
        let name = "Marshal"
        
        let userName = try UserName(name)
        
        #expect(userName.value == name)
    }
    
    @Test("Should throw error")
    func init_with_empty_value() async throws {
        let name = ""
        
        #expect(throws: ValidationError.wrongValue) {
            try UserName(name)
        }
    }
    
    @Test("Should throw error")
    func init_with_nil_value() async throws {
        let name: String? = nil
        
        #expect(throws: ValidationError.wrongValue) {
            try UserName(name)
        }
    }
}
