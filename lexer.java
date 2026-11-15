import org.antlr.v4.runtime.*;

public class lexer {
    public static void main(String[] args) throws Exception {
        
        String[] testStrings = {
            "aabcaccbc",
        };

        for (String testStr : testStrings) {
            System.out.println("\n--- Testing: '" + testStr + "' ---");
            CharStream input = CharStreams.fromString(testStr);
            TemplateLexer lexer = new TemplateLexer(input);
            
            Token token;
            while ((token = lexer.nextToken()).getType() != Token.EOF) {
                if (token.getType() == TemplateLexer.UNKNOWN) {
                    System.out.println("Warning: Skipping invalid character '" + token.getText() + "'");
                } else {
                    String ruleName = TemplateLexer.VOCABULARY.getSymbolicName(token.getType());
                    System.out.println("Token: '" + token.getText() + "' \t-> Rule: " + ruleName);
                }
            }
            System.out.println("EOF");
        }
    }
}
