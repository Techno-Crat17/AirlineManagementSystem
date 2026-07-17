package airlinemanagementsystem;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.util.*;

public class Cancel extends JFrame implements ActionListener {
    
    JTextField tfpnr;
    JLabel tfname, cancellationno, lblfcode, lbldateoftravel;
    JButton fetchButton, flight;
    
    public Cancel() {
        // Apply System Look and Feel
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        getContentPane().setBackground(new Color(245, 247, 250));
        setLayout(null);
        
        Random random = new Random();
        
        // Title
        JLabel heading = new JLabel("FLIGHT CANCELLATION");
        heading.setBounds(120, 20, 350, 35);
        heading.setFont(new Font("Segoe UI", Font.BOLD, 28));
        heading.setForeground(new Color(28, 54, 115));
        add(heading);
        
        Font labelFont = new Font("Segoe UI", Font.PLAIN, 14);
        Color labelColor = new Color(51, 51, 51);
        
        // PNR Input
        JLabel lblpnr = new JLabel("PNR Number");
        lblpnr.setBounds(60, 80, 150, 25);
        lblpnr.setFont(labelFont);
        lblpnr.setForeground(labelColor);
        add(lblpnr);
        
        tfpnr = new JTextField();
        tfpnr.setBounds(220, 80, 150, 25);
        tfpnr.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(tfpnr);
        
        fetchButton = new JButton("Fetch Booking");
        fetchButton.setBackground(new Color(28, 54, 115));
        fetchButton.setForeground(Color.WHITE);
        fetchButton.setFont(new Font("Segoe UI", Font.BOLD, 12));
        fetchButton.setBounds(385, 80, 120, 25);
        fetchButton.setOpaque(true);
        fetchButton.setContentAreaFilled(true);
        fetchButton.setBorderPainted(false);
        fetchButton.setFocusPainted(false);
        fetchButton.addActionListener(this);
        add(fetchButton);
        
        // Passenger Name Display
        JLabel lblname = new JLabel("Passenger Name");
        lblname.setBounds(60, 130, 150, 25);
        lblname.setFont(labelFont);
        lblname.setForeground(labelColor);
        add(lblname);
        
        tfname = new JLabel("-");
        tfname.setBounds(220, 130, 150, 25);
        tfname.setFont(new Font("Segoe UI", Font.BOLD, 14));
        tfname.setForeground(new Color(28, 54, 115));
        add(tfname);
        
        // Cancellation Number Display
        JLabel lblcancelno = new JLabel("Cancellation No");
        lblcancelno.setBounds(60, 180, 150, 25);
        lblcancelno.setFont(labelFont);
        lblcancelno.setForeground(labelColor);
        add(lblcancelno);
        
        cancellationno = new JLabel("CAN-" + (1000 + random.nextInt(9000)));
        cancellationno.setBounds(220, 180, 150, 25);
        cancellationno.setFont(new Font("Segoe UI", Font.BOLD, 14));
        cancellationno.setForeground(new Color(220, 53, 69));
        add(cancellationno);
        
        // Flight Code Display
        JLabel lblfcode = new JLabel("Flight Code");
        lblfcode.setBounds(60, 230, 150, 25);
        lblfcode.setFont(labelFont);
        lblfcode.setForeground(labelColor);
        add(lblfcode);
        
        this.lblfcode = new JLabel("-");
        this.lblfcode.setBounds(220, 230, 150, 25);
        this.lblfcode.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(this.lblfcode);
        
        // Date Display
        JLabel lbldate = new JLabel("Date of Travel");
        lbldate.setBounds(60, 280, 150, 25);
        lbldate.setFont(labelFont);
        lbldate.setForeground(labelColor);
        add(lbldate);
        
        lbldateoftravel = new JLabel("-");
        lbldateoftravel.setBounds(220, 280, 150, 25);
        lbldateoftravel.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(lbldateoftravel);
        
        // Cancel Button
        flight = new JButton("CANCEL TICKET");
        flight.setBackground(new Color(220, 53, 69)); // Crimson Red
        flight.setForeground(Color.WHITE);
        flight.setFont(new Font("Segoe UI", Font.BOLD, 14));
        flight.setBounds(220, 340, 180, 35);
        flight.setOpaque(true);
        flight.setContentAreaFilled(true);
        flight.setBorderPainted(false);
        flight.setFocusPainted(false);
        flight.addActionListener(this);
        add(flight);
        
        // Side Illustration
        ImageIcon i1 = new ImageIcon(ClassLoader.getSystemResource("airlinemanagementsystem/icons/cancel.jpg"));
        Image i2 = i1.getImage().getScaledInstance(250, 250, Image.SCALE_DEFAULT);
        ImageIcon i3 = new ImageIcon(i2);
        JLabel image = new JLabel(i3);
        image.setBounds(500, 80, 250, 250);
        add(image);
        
        setSize(800, 450);
        setLocationRelativeTo(null); // Center on screen
        setVisible(true);
    }
    
    public void actionPerformed(ActionEvent ae) {
        if (ae.getSource() == fetchButton) {
            String pnr = tfpnr.getText().trim();
            if (pnr.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Please enter a PNR number", "Validation Error", JOptionPane.ERROR_MESSAGE);
                return;
            }
            
            try {
                Conn conn = new Conn();
                String query = "select * from reservation where PNR = '"+pnr+"'";
                ResultSet rs = conn.s.executeQuery(query);
                
                if (rs.next()) {
                    tfname.setText(rs.getString("name"));
                    lblfcode.setText(rs.getString("flightcode"));
                    lbldateoftravel.setText(rs.getString("ddate"));
                } else {
                    JOptionPane.showMessageDialog(null, "Please enter a correct PNR", "Not Found", JOptionPane.WARNING_MESSAGE);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (ae.getSource() == flight) {
            String name = tfname.getText();
            String pnr = tfpnr.getText().trim();
            String cancelno = cancellationno.getText();
            String fcode = lblfcode.getText();
            String date = lbldateoftravel.getText();
            
            if (name.equals("-")) {
                JOptionPane.showMessageDialog(null, "Please fetch booking details first using a valid PNR", "Validation Error", JOptionPane.ERROR_MESSAGE);
                return;
            }
            
            try {
                Conn conn = new Conn();
                String query = "insert into cancel values('"+pnr+"', '"+name+"', '"+cancelno+"', '"+fcode+"', '"+date+"')";
                conn.s.executeUpdate(query);
                conn.s.executeUpdate("delete from reservation where PNR = '"+pnr+"'");
                
                JOptionPane.showMessageDialog(null, "Ticket Cancelled Successfully", "Cancelled", JOptionPane.INFORMATION_MESSAGE);
                setVisible(false);
            } catch (Exception e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(null, "Cancellation failed", "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }
    
    public static void main(String[] args) {
        new Cancel();
    }
}
