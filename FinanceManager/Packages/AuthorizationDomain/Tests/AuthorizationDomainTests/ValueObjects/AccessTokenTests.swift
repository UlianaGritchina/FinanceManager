import Testing
@testable import AuthorizationDomain

@Suite
struct AccessTokenTests {
    @Test("Successful init")
    func init_with_valid_value() async throws {
        let token = "123"
        
        let accessToken = try AccessToken(token)
        
        #expect(accessToken.value == token)
    }
    
    @Test("Should throw error")
    func init_with_empty_value() async throws {
        let token = ""
        
        #expect(throws: ValidationError.wrongValue) {
            try AccessToken(token)
        }
    }
    
    @Test("Should throw error")
    func init_with_nil_value() async throws {
        let token: String? = nil
        
        #expect(throws: ValidationError.wrongValue) {
            try AccessToken(token)
        }
    }
}

