package airlinemanagementsystem;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class Login extends JFrame implements ActionListener {
    JButton submit, reset, close;
    JTextField tfusername;
    JPasswordField tfpassword;
    
    public Login() {
        // Apply System Look and Feel
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        getContentPane().setBackground(new Color(245, 247, 250)); // Premium off-white/light gray
        setLayout(null);
        
        // Form Title
        JLabel title = new JLabel("ADMIN LOGIN");
        title.setBounds(100, 15, 200, 30);
        title.setFont(new Font("Segoe UI", Font.BOLD, 22));
        title.setForeground(new Color(28, 54, 115)); // Deep Navy Blue
        title.setHorizontalAlignment(SwingConstants.CENTER);
        add(title);
        
        // Username
        JLabel lblusername = new JLabel("Username");
        lblusername.setBounds(40, 65, 100, 20);
        lblusername.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        lblusername.setForeground(new Color(73, 80, 87));
        add(lblusername);
        
        tfusername = new JTextField();
        tfusername.setBounds(140, 65, 200, 25);
        tfusername.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(tfusername);
        
        // Password
        JLabel lblpassword = new JLabel("Password");
        lblpassword.setBounds(40, 110, 100, 20);
        lblpassword.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        lblpassword.setForeground(new Color(73, 80, 87));
        add(lblpassword);
        
        tfpassword = new JPasswordField();
        tfpassword.setBounds(140, 110, 200, 25);
        tfpassword.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(tfpassword);
        
        // Reset Button
        reset = new JButton("Reset");
        reset.setBounds(40, 160, 95, 30);
        reset.setBackground(new Color(108, 117, 125)); // Gray
        reset.setForeground(Color.WHITE);
        reset.setFont(new Font("Segoe UI", Font.BOLD, 13));
        reset.setOpaque(true);
        reset.setContentAreaFilled(true);
        reset.setBorderPainted(false);
        reset.setFocusPainted(false);
        reset.addActionListener(this);
        add(reset);
        
        // Submit Button
        submit = new JButton("Submit");
        submit.setBounds(145, 160, 95, 30);
        submit.setBackground(new Color(28, 54, 115)); // Navy Blue
        submit.setForeground(Color.WHITE);
        submit.setFont(new Font("Segoe UI", Font.BOLD, 13));
        submit.setOpaque(true);
        submit.setContentAreaFilled(true);
        submit.setBorderPainted(false);
        submit.setFocusPainted(false);
        submit.addActionListener(this);
        add(submit);
        
        // Close Button
        close = new JButton("Close");
        close.setBounds(250, 160, 90, 30);
        close.setBackground(new Color(220, 53, 69)); // Crimson Red
        close.setForeground(Color.WHITE);
        close.setFont(new Font("Segoe UI", Font.BOLD, 13));
        close.setOpaque(true);
        close.setContentAreaFilled(true);
        close.setBorderPainted(false);
        close.setFocusPainted(false);
        close.addActionListener(this);
        add(close);
        
        setSize(400, 250);
        setLocationRelativeTo(null); // Center on screen
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }
    
    public void actionPerformed(ActionEvent ae) {
        if (ae.getSource() == submit) {
            String username = tfusername.getText();
            String password = new String(tfpassword.getPassword());
            
            try {
                Conn c = new Conn();
                
                String query = "select * from login where username = '"+username+"' and password = '"+password+"'";
                
                ResultSet rs = c.s.executeQuery(query);
                
                if (rs.next()) {
                    new Home();
                    setVisible(false);
                } else {
                    JOptionPane.showMessageDialog(null, "Invalid Username or Password", "Login Failed", JOptionPane.ERROR_MESSAGE);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (ae.getSource() == close) {
            setVisible(false);
            System.exit(0);
        } else if (ae.getSource() == reset) {
            tfusername.setText("");
            tfpassword.setText("");
        }
    }
    
    public static void main(String[] args) {
        new Login();
    }
}
