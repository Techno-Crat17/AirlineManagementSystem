package airlinemanagementsystem;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.text.AbstractDocument;

public class AddCustomer extends JFrame implements ActionListener {
    
    JTextField tfname, tfphone, tfaadhar, tfnationality, tfaddress;
    JRadioButton rbmale, rbfemale;
    
    public AddCustomer() {
        // Apply System Look and Feel
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        getContentPane().setBackground(new Color(245, 247, 250)); // Light Gray background
        setLayout(null);
        
        // Heading
        JLabel heading = new JLabel("ADD PASSENGER DETAILS");
        heading.setBounds(220, 20, 500, 35);
        heading.setFont(new Font("Segoe UI", Font.BOLD, 28));
        heading.setForeground(new Color(28, 54, 115)); // Deep Navy Blue
        add(heading);
        
        // Font for all labels
        Font labelFont = new Font("Segoe UI", Font.PLAIN, 14);
        Color labelColor = new Color(51, 51, 51);
        
        // Name
        JLabel lblname = new JLabel("Name");
        lblname.setBounds(60, 80, 150, 25);
        lblname.setFont(labelFont);
        lblname.setForeground(labelColor);
        add(lblname);
        
        tfname = new JTextField();
        tfname.setBounds(220, 80, 180, 25);
        tfname.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(tfname);
        
        // Nationality
        JLabel lblnationality = new JLabel("Nationality");
        lblnationality.setBounds(60, 130, 150, 25);
        lblnationality.setFont(labelFont);
        lblnationality.setForeground(labelColor);
        add(lblnationality);
        
        tfnationality = new JTextField();
        tfnationality.setBounds(220, 130, 180, 25);
        tfnationality.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(tfnationality);
        
        // Aadhar
        JLabel lblaadhar = new JLabel("Aadhar Number");
        lblaadhar.setBounds(60, 180, 150, 25);
        lblaadhar.setFont(labelFont);
        lblaadhar.setForeground(labelColor);
        add(lblaadhar);
        
        tfaadhar = new JTextField();
        tfaadhar.setBounds(220, 180, 180, 25);
        tfaadhar.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        ((AbstractDocument) tfaadhar.getDocument()).setDocumentFilter(new DigitLimitFilter(12));
        add(tfaadhar);
        
        // Address
        JLabel lbladdress = new JLabel("Address");
        lbladdress.setBounds(60, 230, 150, 25);
        lbladdress.setFont(labelFont);
        lbladdress.setForeground(labelColor);
        add(lbladdress);
        
        tfaddress = new JTextField();
        tfaddress.setBounds(220, 230, 180, 25);
        tfaddress.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(tfaddress);
        
        // Gender
        JLabel lblgender = new JLabel("Gender");
        lblgender.setBounds(60, 280, 150, 25);
        lblgender.setFont(labelFont);
        lblgender.setForeground(labelColor);
        add(lblgender);
        
        ButtonGroup gendergroup = new ButtonGroup();
        
        rbmale = new JRadioButton("Male");
        rbmale.setBounds(220, 280, 80, 25);
        rbmale.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        rbmale.setBackground(new Color(245, 247, 250));
        add(rbmale);
        
        rbfemale = new JRadioButton("Female");
        rbfemale.setBounds(310, 280, 90, 25);
        rbfemale.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        rbfemale.setBackground(new Color(245, 247, 250));
        add(rbfemale);
        
        gendergroup.add(rbmale);
        gendergroup.add(rbfemale);
        
        // Phone
        JLabel lblphone = new JLabel("Phone Number");
        lblphone.setBounds(60, 330, 150, 25);
        lblphone.setFont(labelFont);
        lblphone.setForeground(labelColor);
        add(lblphone);
        
        tfphone = new JTextField();
        tfphone.setBounds(220, 330, 180, 25);
        tfphone.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        ((AbstractDocument) tfphone.getDocument()).setDocumentFilter(new DigitLimitFilter(10));
        add(tfphone);
        
        // Save Button
        JButton save = new JButton("SAVE DETAILS");
        save.setBackground(new Color(28, 54, 115)); // Premium Navy
        save.setForeground(Color.WHITE);
        save.setFont(new Font("Segoe UI", Font.BOLD, 14));
        save.setBounds(220, 390, 180, 35);
        save.setOpaque(true);
        save.setContentAreaFilled(true);
        save.setBorderPainted(false);
        save.setFocusPainted(false);
        save.addActionListener(this);
        add(save);
        
        // Profile Image
        ImageIcon image = new ImageIcon(ClassLoader.getSystemResource("airlinemanagementsystem/icons/emp.png"));
        JLabel lblimage = new JLabel(image);
        lblimage.setBounds(460, 80, 380, 380);
        add(lblimage);
        
        setSize(900, 520);
        setLocationRelativeTo(null); // Center on screen
        setVisible(true);
    }
    
    public void actionPerformed(ActionEvent ae) {
        String name = tfname.getText().trim();
        String nationality = tfnationality.getText().trim();
        String phone = tfphone.getText().trim();
        String address = tfaddress.getText().trim();
        String aadhar = tfaadhar.getText().trim();
        
        if (name.isEmpty() || nationality.isEmpty() || phone.isEmpty() || address.isEmpty() || aadhar.isEmpty()) {
            JOptionPane.showMessageDialog(null, "All fields are required!", "Validation Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
        
        if (!rbmale.isSelected() && !rbfemale.isSelected()) {
            JOptionPane.showMessageDialog(null, "Please select a gender", "Validation Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
        
        if (!name.matches("[a-zA-Z\\s]+")) {
            JOptionPane.showMessageDialog(null, "Name can only contain letters and spaces", "Validation Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
        
        if (phone.length() != 10) {
            JOptionPane.showMessageDialog(null, "Phone number must be exactly 10 digits", "Validation Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
        
        if (aadhar.length() != 12) {
            JOptionPane.showMessageDialog(null, "Aadhar number must be exactly 12 digits", "Validation Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
        
        String gender = rbmale.isSelected() ? "Male" : "Female";
        
        try {
            Conn conn = new Conn();
            String query = "insert into passenger values('"+name+"', '"+nationality+"', '"+phone+"', '"+address+"', '"+aadhar+"', '"+gender+"')";
            conn.s.executeUpdate(query);
            JOptionPane.showMessageDialog(null, "Customer Details Added Successfully", "Success", JOptionPane.INFORMATION_MESSAGE);
            setVisible(false);
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Database insertion failed", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public static void main(String[] args) {
        new AddCustomer();
    }
}
