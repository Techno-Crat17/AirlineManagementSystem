package airlinemanagementsystem;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import com.toedter.calendar.JDateChooser;
import java.util.*;
import javax.swing.text.AbstractDocument;

public class BookFlight extends JFrame implements ActionListener {
    
    JTextField tfaadhar;
    JLabel tfname, tfnationality, tfaddress, labelgender, labelfname, labelfcode;
    JButton bookflight, fetchButton, flight;
    Choice source, destination;
    JDateChooser dcdate;
    
    public BookFlight() {
        // Apply System Look and Feel
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        getContentPane().setBackground(new Color(245, 247, 250));
        setLayout(null);
        
        // Title
        JLabel heading = new JLabel("BOOK FLIGHT TICKET");
        heading.setBounds(380, 20, 500, 35);
        heading.setFont(new Font("Segoe UI", Font.BOLD, 28));
        heading.setForeground(new Color(28, 54, 115));
        add(heading);
        
        Font labelFont = new Font("Segoe UI", Font.PLAIN, 14);
        Color labelColor = new Color(51, 51, 51);
        
        // Aadhar Input
        JLabel lblaadhar = new JLabel("Aadhar Number");
        lblaadhar.setBounds(60, 80, 150, 25);
        lblaadhar.setFont(labelFont);
        lblaadhar.setForeground(labelColor);
        add(lblaadhar);
        
        tfaadhar = new JTextField();
        tfaadhar.setBounds(220, 80, 150, 25);
        tfaadhar.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        ((AbstractDocument) tfaadhar.getDocument()).setDocumentFilter(new DigitLimitFilter(12));
        add(tfaadhar);
        
        fetchButton = new JButton("Fetch User");
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
        
        // Name Display
        JLabel lblname = new JLabel("Name");
        lblname.setBounds(60, 130, 150, 25);
        lblname.setFont(labelFont);
        lblname.setForeground(labelColor);
        add(lblname);
        
        tfname = new JLabel("-");
        tfname.setBounds(220, 130, 150, 25);
        tfname.setFont(new Font("Segoe UI", Font.BOLD, 14));
        tfname.setForeground(new Color(28, 54, 115));
        add(tfname);
        
        // Nationality Display
        JLabel lblnationality = new JLabel("Nationality");
        lblnationality.setBounds(60, 180, 150, 25);
        lblnationality.setFont(labelFont);
        lblnationality.setForeground(labelColor);
        add(lblnationality);
        
        tfnationality = new JLabel("-");
        tfnationality.setBounds(220, 180, 150, 25);
        tfnationality.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(tfnationality);
        
        // Address Display
        JLabel lbladdress = new JLabel("Address");
        lbladdress.setBounds(60, 230, 150, 25);
        lbladdress.setFont(labelFont);
        lbladdress.setForeground(labelColor);
        add(lbladdress);
        
        tfaddress = new JLabel("-");
        tfaddress.setBounds(220, 230, 150, 25);
        tfaddress.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(tfaddress);
        
        // Gender Display
        JLabel lblgender = new JLabel("Gender");
        lblgender.setBounds(60, 280, 150, 25);
        lblgender.setFont(labelFont);
        lblgender.setForeground(labelColor);
        add(lblgender);
        
        labelgender = new JLabel("-");
        labelgender.setBounds(220, 280, 150, 25);
        labelgender.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(labelgender);
        
        // Source
        JLabel lblsource = new JLabel("Source");
        lblsource.setBounds(60, 330, 150, 25);
        lblsource.setFont(labelFont);
        lblsource.setForeground(labelColor);
        add(lblsource);
        
        source = new Choice();
        source.setBounds(220, 330, 150, 25);
        source.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        add(source);
        
        // Destination
        JLabel lbldest = new JLabel("Destination");
        lbldest.setBounds(60, 380, 150, 25);
        lbldest.setFont(labelFont);
        lbldest.setForeground(labelColor);
        add(lbldest);
        
        destination = new Choice();
        destination.setBounds(220, 380, 150, 25);
        destination.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        add(destination);
        
        // Populate Source & Destination Dropdowns
        try {
            Conn c = new Conn();
            String query = "select distinct source, destination from flight";
            ResultSet rs = c.s.executeQuery(query);
            Set<String> srcSet = new HashSet<>();
            Set<String> destSet = new HashSet<>();
            
            while (rs.next()) {
                srcSet.add(rs.getString("source"));
                destSet.add(rs.getString("destination"));
            }
            for (String srcVal : srcSet) source.add(srcVal);
            for (String destVal : destSet) destination.add(destVal);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        flight = new JButton("Search Flights");
        flight.setBackground(new Color(28, 54, 115));
        flight.setForeground(Color.WHITE);
        flight.setFont(new Font("Segoe UI", Font.BOLD, 12));
        flight.setBounds(385, 380, 120, 25);
        flight.setOpaque(true);
        flight.setContentAreaFilled(true);
        flight.setBorderPainted(false);
        flight.setFocusPainted(false);
        flight.addActionListener(this);
        add(flight);
        
        // Flight Name Display
        JLabel lblfname = new JLabel("Flight Name");
        lblfname.setBounds(60, 430, 150, 25);
        lblfname.setFont(labelFont);
        lblfname.setForeground(labelColor);
        add(lblfname);
        
        labelfname = new JLabel("-");
        labelfname.setBounds(220, 430, 150, 25);
        labelfname.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(labelfname);
        
        // Flight Code Display
        JLabel lblfcode = new JLabel("Flight Code");
        lblfcode.setBounds(60, 480, 150, 25);
        lblfcode.setFont(labelFont);
        lblfcode.setForeground(labelColor);
        add(lblfcode);
        
        labelfcode = new JLabel("-");
        labelfcode.setBounds(220, 480, 150, 25);
        labelfcode.setFont(new Font("Segoe UI", Font.BOLD, 14));
        labelfcode.setForeground(new Color(28, 54, 115));
        add(labelfcode);
        
        // Travel Date
        JLabel lbldate = new JLabel("Date of Travel");
        lbldate.setBounds(60, 530, 150, 25);
        lbldate.setFont(labelFont);
        lbldate.setForeground(labelColor);
        add(lbldate);
        
        dcdate = new JDateChooser();
        dcdate.setBounds(220, 530, 150, 25);
        dcdate.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        add(dcdate);
        
        // Booking Details Image
        ImageIcon i1 = new ImageIcon(ClassLoader.getSystemResource("airlinemanagementsystem/icons/details.jpg"));
        Image i2 = i1.getImage().getScaledInstance(450, 320, Image.SCALE_DEFAULT);
        ImageIcon image = new ImageIcon(i2);
        JLabel lblimage = new JLabel(image);
        lblimage.setBounds(550, 80, 500, 410);
        add(lblimage);
        
        // Booking Button
        bookflight = new JButton("BOOK FLIGHT TICKET");
        bookflight.setBackground(new Color(40, 167, 69)); // Premium Green
        bookflight.setForeground(Color.WHITE);
        bookflight.setFont(new Font("Segoe UI", Font.BOLD, 14));
        bookflight.setBounds(220, 580, 180, 35);
        bookflight.setOpaque(true);
        bookflight.setContentAreaFilled(true);
        bookflight.setBorderPainted(false);
        bookflight.setFocusPainted(false);
        bookflight.addActionListener(this);
        add(bookflight);
        
        setSize(1100, 680);
        setLocationRelativeTo(null); // Center on screen
        setVisible(true);
    }
    
    public void actionPerformed(ActionEvent ae) {
        if (ae.getSource() == fetchButton) {
            String aadhar = tfaadhar.getText().trim();
            if (aadhar.length() != 12) {
                JOptionPane.showMessageDialog(null, "Aadhar number must be exactly 12 digits", "Validation Error", JOptionPane.ERROR_MESSAGE);
                return;
            }
            
            try {
                Conn conn = new Conn();
                String query = "select * from passenger where aadhar = '"+aadhar+"'";
                ResultSet rs = conn.s.executeQuery(query);
                
                if (rs.next()) {
                    tfname.setText(rs.getString("name"));
                    tfnationality.setText(rs.getString("nationality"));
                    tfaddress.setText(rs.getString("address"));
                    labelgender.setText(rs.getString("gender"));
                } else {
                    JOptionPane.showMessageDialog(null, "No passenger found with this Aadhar number", "Not Found", JOptionPane.WARNING_MESSAGE);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (ae.getSource() == flight) {
            String src = source.getSelectedItem();
            String dest = destination.getSelectedItem();
            try {
                Conn conn = new Conn();
                String query = "select * from flight where source = '"+src+"' and destination = '"+dest+"'";
                ResultSet rs = conn.s.executeQuery(query);
                
                if (rs.next()) {
                    labelfname.setText(rs.getString("f_name"));
                    labelfcode.setText(rs.getString("f_code"));
                } else {
                    JOptionPane.showMessageDialog(null, "No Flights Found for this route", "No Flight", JOptionPane.WARNING_MESSAGE);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            String aadhar = tfaadhar.getText().trim();
            String name = tfname.getText();
            String nationality = tfnationality.getText();
            String flightname = labelfname.getText();
            String flightcode = labelfcode.getText();
            String src = source.getSelectedItem();
            String des = destination.getSelectedItem();
            
            if (name == null || name.equals("-")) {
                JOptionPane.showMessageDialog(null, "Please fetch user details first using a valid Aadhar number", "Validation Error", JOptionPane.ERROR_MESSAGE);
                return;
            }
            
            if (flightcode == null || flightcode.equals("-")) {
                JOptionPane.showMessageDialog(null, "Please search flights first and select one", "Validation Error", JOptionPane.ERROR_MESSAGE);
                return;
            }
            
            if (dcdate.getDate() == null) {
                JOptionPane.showMessageDialog(null, "Please select Date of Travel", "Validation Error", JOptionPane.ERROR_MESSAGE);
                return;
            }
            
            String ddate = ((JTextField) dcdate.getDateEditor().getUiComponent()).getText();
            Random random = new Random();
            String pnrVal = "PNR-" + random.nextInt(1000000);
            String ticketVal = "TIC-" + random.nextInt(10000);
            
            try {
                Conn conn = new Conn();
                String query = "insert into reservation values('"+pnrVal+"', '"+ticketVal+"', '"+aadhar+"', '"+name+"', '"+nationality+"', '"+flightname+"', '"+flightcode+"', '"+src+"', '"+des+"', '"+ddate+"')";
                conn.s.executeUpdate(query);
                JOptionPane.showMessageDialog(null, "Ticket Booked Successfully\nYour PNR: " + pnrVal, "Booking Success", JOptionPane.INFORMATION_MESSAGE);
                setVisible(false);
                new BoardingPass(pnrVal); // Open Boarding Pass automatically with the generated PNR
            } catch (Exception e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(null, "Booking failed", "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }
    
    public static void main(String[] args) {
        new BookFlight();
    }
}
