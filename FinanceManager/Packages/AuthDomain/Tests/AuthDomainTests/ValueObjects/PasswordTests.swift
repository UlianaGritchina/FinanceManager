import Testing
@testable import AuthDomain

@Suite
struct PasswordTests {
    @Test("Successful init")
    func init_with_valid_value() async throws {
        let pass = "123"
        
        let password = try Password(pass)
        
        #expect(password.value == pass)
    }
    
    @Test("Should throw error")
    func init_with_empty_value() async throws {
        let pass = ""
        
        #expect(throws: ValidationError.wrongValue) {
            try Password(pass)
        }
    }
    
    @Test("Should throw error")
    func init_with_nil_value() async throws {
        let pass: String? = nil
        
        #expect(throws: ValidationError.wrongValue) {
            try Password(pass)
        }
    }
}
