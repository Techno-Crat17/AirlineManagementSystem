package airlinemanagementsystem;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Home extends JFrame implements ActionListener {
    
    public Home() {
        // Apply System Look and Feel
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        setLayout(null);
        setTitle("Airline Management System - Dashboard");
        
        // Get actual display screen size
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        int width = (int) screenSize.getWidth();
        int height = (int) screenSize.getHeight();
        
        // Background Image scaled dynamically to fit screen
        ImageIcon i1 = new ImageIcon(ClassLoader.getSystemResource("airlinemanagementsystem/icons/front.jpg"));
        Image i2 = i1.getImage().getScaledInstance(width, height, Image.SCALE_DEFAULT);
        ImageIcon imageIcon = new ImageIcon(i2);
        JLabel image = new JLabel(imageIcon);
        image.setBounds(0, 0, width, height);
        add(image);
        
        // Welcome Heading dynamically centered
        JLabel heading = new JLabel("Aapki Har Udaan Ka Saathi");
        heading.setFont(new Font("Segoe UI", Font.BOLD, 38));
        heading.setForeground(new Color(28, 54, 115)); // Deep Navy Blue
        
        int headingWidth = 600;
        int headingHeight = 45;
        int headingX = (width - headingWidth) / 2;
        heading.setBounds(headingX, 40, headingWidth, headingHeight);
        heading.setHorizontalAlignment(SwingConstants.CENTER);
        image.add(heading);
        
        // Menubar
        JMenuBar menubar = new JMenuBar();
        menubar.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        setJMenuBar(menubar);
        
        // Details Menu
        JMenu details = new JMenu("Details");
        details.setFont(new Font("Segoe UI", Font.BOLD, 14));
        menubar.add(details);
        
        JMenuItem flightDetails = new JMenuItem("Flight Details");
        flightDetails.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        flightDetails.addActionListener(this);
        details.add(flightDetails);
        
        JMenuItem customerDetails = new JMenuItem("Add Customer Details");
        customerDetails.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        customerDetails.addActionListener(this);
        details.add(customerDetails);
        
        JMenuItem bookFlight = new JMenuItem("Book Flight");
        bookFlight.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        bookFlight.addActionListener(this);
        details.add(bookFlight);
        
        JMenuItem journeyDetails = new JMenuItem("Journey Details");
        journeyDetails.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        journeyDetails.addActionListener(this);
        details.add(journeyDetails);
        
        JMenuItem ticketCancellation = new JMenuItem("Cancel Ticket");
        ticketCancellation.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        ticketCancellation.addActionListener(this);
        details.add(ticketCancellation);
        
        // Ticket Menu
        JMenu ticket = new JMenu("Ticket");
        ticket.setFont(new Font("Segoe UI", Font.BOLD, 14));
        menubar.add(ticket);
        
        JMenuItem boardingPass = new JMenuItem("Boarding Pass");
        boardingPass.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        boardingPass.addActionListener(this);
        ticket.add(boardingPass);
        
        setExtendedState(JFrame.MAXIMIZED_BOTH);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }
    
    public void actionPerformed(ActionEvent ae) {
        String text = ae.getActionCommand();
        
        if (text.equals("Add Customer Details")) {
            new AddCustomer();
        } else if (text.equals("Flight Details")) {
            new FlightInfo();
        } else if (text.equals("Book Flight")) {
            new BookFlight();
        } else if (text.equals("Journey Details")) {
            new JourneyDetails();
        } else if (text.equals("Cancel Ticket")) {
            new Cancel();
        } else if (text.equals("Boarding Pass")) {
            new BoardingPass();
        }
    }
    
    public static void main(String[] args) {
        new Home();
    }
}
