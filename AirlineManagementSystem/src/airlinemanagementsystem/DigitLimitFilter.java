package airlinemanagementsystem;

import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.DocumentFilter;

/**
 * Reusable DocumentFilter to limit text input to digits only and restrict maximum length.
 */
public class DigitLimitFilter extends DocumentFilter {
    private final int limit;

    public DigitLimitFilter(int limit) {
        this.limit = limit;
    }

    @Override
    public void insertString(FilterBypass fb, int offset, String string, AttributeSet attr) throws BadLocationException {
        if (string == null) return;
        if (isNumeric(string) && (fb.getDocument().getLength() + string.length() <= limit)) {
            super.insertString(fb, offset, string, attr);
        }
    }

    @Override
    public void replace(FilterBypass fb, int offset, int length, String text, AttributeSet attrs) throws BadLocationException {
        if (text == null) return;
        if (isNumeric(text) && (fb.getDocument().getLength() - length + text.length() <= limit)) {
            super.replace(fb, offset, length, text, attrs);
        }
    }

    private boolean isNumeric(String text) {
        return text.matches("\\d*");
    }
}
