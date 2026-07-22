import Testing
@testable import AuthDomain

@Suite
struct RefreshTokenTests {
    @Test("Successful init")
    func init_with_valid_value() async throws {
        let token = "123"
        
        let refreshToken = try RefreshToken(token)
        
        #expect(refreshToken.value == token)
    }
    
    @Test("Should throw error")
    func init_with_empty_value() async throws {
        let token = ""
        
        #expect(throws: ValidationError.wrongValue) {
            try RefreshToken(token)
        }
    }
    
    @Test("Should throw error")
    func init_with_nil_value() async throws {
        let token: String? = nil
        
        #expect(throws: ValidationError.wrongValue) {
            try RefreshToken(token)
        }
    }
}
