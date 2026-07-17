package airlinemanagementsystem;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class BoardingPass extends JFrame implements ActionListener {
    
    JTextField tfpnr;
    JLabel tfname, tfnationality, lblsrc, lbldest, labelfname, labelfcode, labeldate;
    JButton fetchButton;
    
    public BoardingPass() {
        // Apply System Look and Feel
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        getContentPane().setBackground(new Color(245, 247, 250));
        setLayout(null);
        
        // Brand Title
        JLabel heading = new JLabel("AIR INDIA");
        heading.setBounds(380, 10, 450, 35);
        heading.setFont(new Font("Segoe UI", Font.BOLD, 32));
        heading.setForeground(new Color(28, 54, 115));
        add(heading);
        
        JLabel subheading = new JLabel("Boarding Pass");
        subheading.setBounds(360, 50, 300, 30);
        subheading.setFont(new Font("Segoe UI", Font.PLAIN, 20));
        subheading.setForeground(new Color(108, 117, 125));
        add(subheading);
        
        Font labelFont = new Font("Segoe UI", Font.PLAIN, 14);
        Color labelColor = new Color(51, 51, 51);
        
        // PNR Input
        JLabel lblpnr = new JLabel("PNR DETAILS");
        lblpnr.setBounds(60, 100, 150, 25);
        lblpnr.setFont(labelFont);
        lblpnr.setForeground(labelColor);
        add(lblpnr);
        
        tfpnr = new JTextField();
        tfpnr.setBounds(220, 100, 150, 25);
        tfpnr.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(tfpnr);
        
        fetchButton = new JButton("Enter");
        fetchButton.setBackground(new Color(28, 54, 115));
        fetchButton.setForeground(Color.WHITE);
        fetchButton.setFont(new Font("Segoe UI", Font.BOLD, 12));
        fetchButton.setBounds(385, 100, 100, 25);
        fetchButton.setOpaque(true);
        fetchButton.setContentAreaFilled(true);
        fetchButton.setBorderPainted(false);
        fetchButton.setFocusPainted(false);
        fetchButton.addActionListener(this);
        add(fetchButton);
        
        // Passenger Name
        JLabel lblname = new JLabel("NAME");
        lblname.setBounds(60, 150, 150, 25);
        lblname.setFont(labelFont);
        lblname.setForeground(labelColor);
        add(lblname);
        
        tfname = new JLabel("-");
        tfname.setBounds(220, 150, 150, 25);
        tfname.setFont(new Font("Segoe UI", Font.BOLD, 14));
        tfname.setForeground(new Color(28, 54, 115));
        add(tfname);
        
        // Nationality
        JLabel lblnationality = new JLabel("NATIONALITY");
        lblnationality.setBounds(60, 200, 150, 25);
        lblnationality.setFont(labelFont);
        lblnationality.setForeground(labelColor);
        add(lblnationality);
        
        tfnationality = new JLabel("-");
        tfnationality.setBounds(220, 200, 150, 25);
        tfnationality.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(tfnationality);
        
        // Source
        JLabel lblsource = new JLabel("SRC");
        lblsource.setBounds(60, 250, 150, 25);
        lblsource.setFont(new Font("Segoe UI", Font.BOLD, 14));
        lblsource.setForeground(new Color(28, 54, 115));
        add(lblsource);
        
        lblsrc = new JLabel("-");
        lblsrc.setBounds(220, 250, 150, 25);
        lblsrc.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(lblsrc);
        
        // Destination
        JLabel lbldestination = new JLabel("DEST");
        lbldestination.setBounds(380, 250, 150, 25);
        lbldestination.setFont(new Font("Segoe UI", Font.BOLD, 14));
        lbldination = lbldestination; // Helper
        lblsrc.setForeground(new Color(51, 51, 51));
        lbldestination.setForeground(new Color(28, 54, 115));
        add(lbldestination);
        
        lbldest = new JLabel("-");
        lbldest.setBounds(540, 250, 150, 25);
        lbldest.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(lbldest);
        
        // Flight Name
        JLabel lblfname = new JLabel("FLIGHT NAME");
        lblfname.setBounds(60, 300, 150, 25);
        lblfname.setFont(labelFont);
        lblfname.setForeground(labelColor);
        add(lblfname);
        
        labelfname = new JLabel("-");
        labelfname.setBounds(220, 300, 150, 25);
        labelfname.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(labelfname);
        
        // Flight Code
        JLabel lblfcode = new JLabel("FLIGHT CODE");
        lblfcode.setBounds(380, 300, 150, 25);
        lblfcode.setFont(labelFont);
        lblfcode.setForeground(labelColor);
        add(lblfcode);
        
        labelfcode = new JLabel("-");
        labelfcode.setBounds(540, 300, 150, 25);
        labelfcode.setFont(new Font("Segoe UI", Font.BOLD, 14));
        labelfcode.setForeground(new Color(28, 54, 115));
        add(labelfcode);
        
        // Date
        JLabel lbldate = new JLabel("DATE");
        lbldate.setBounds(60, 350, 150, 25);
        lbldate.setFont(labelFont);
        lbldate.setForeground(labelColor);
        add(lbldate);
        
        labeldate = new JLabel("-");
        labeldate.setBounds(220, 350, 150, 25);
        labeldate.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(labeldate);
        
        // Side Logo Image
        ImageIcon i1 = new ImageIcon(ClassLoader.getSystemResource("airlinemanagementsystem/icons/airindia.png"));
        Image i2 = i1.getImage().getScaledInstance(300, 230, Image.SCALE_DEFAULT);
        ImageIcon image = new ImageIcon(i2);
        JLabel lblimage = new JLabel(image);
        lblimage.setBounds(650, 50, 300, 300);
        add(lblimage);
        
        setSize(1000, 450);
        setLocationRelativeTo(null); // Center on screen
        setVisible(true);
    }
    
    public BoardingPass(String pnr) {
        this();
        tfpnr.setText(pnr);
        fetchButton.doClick();
    }
    
    // Auxiliary field mapping fix
    private JLabel lbldination;
    
    public void actionPerformed(ActionEvent ae) {
        String pnr = tfpnr.getText().trim();
        if (pnr.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Please enter a valid PNR number", "Validation Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
        
        try {
            Conn conn = new Conn();
            String query = "select * from reservation where PNR = '"+pnr+"'";
            ResultSet rs = conn.s.executeQuery(query);
            
            if (rs.next()) {
                tfname.setText(rs.getString("name"));
                tfnationality.setText(rs.getString("nationality"));
                lblsrc.setText(rs.getString("src"));
                lbldest.setText(rs.getString("des"));
                labelfname.setText(rs.getString("flightname"));
                labelfcode.setText(rs.getString("flightcode"));
                labeldate.setText(rs.getString("ddate"));
            } else {
                JOptionPane.showMessageDialog(null, "No ticket found for this PNR details", "Not Found", JOptionPane.WARNING_MESSAGE);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        new BoardingPass();
    }
}
