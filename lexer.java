import org.antlr.v4.runtime.*;

public class lexer {
    public static void main(String[] args) throws Exception {
        
        String[] testStrings = {
            "aabcaccbc",
        };

        for (String testStr : testStrings) {
            System.out.println("\n--- Testing: '" + testStr + "' ---");
            CharStream input = CharStreams.fromString(testStr);
            vrlexer lexer = new vrlexer(input);
            
            Token token;
            while ((token = lexer.nextToken()).getType() != Token.EOF) {
                if (token.getType() == vrlexer.UNKNOWN) {
                    System.out.println("Warning: Skipping invalid character '" + token.getText() + "'");
                } else {
                    String ruleName = vrlexer.VOCABULARY.getSymbolicName(token.getType());
                    System.out.println("Token: '" + token.getText() + "' \t-> Rule: " + ruleName);
                }
            }
            System.out.println("EOF");
        }
    }
}