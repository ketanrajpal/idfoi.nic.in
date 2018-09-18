﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net.Mime;

public partial class email : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        MailMessage mailMessage = new MailMessage();
        mailMessage.To.Add("info@krpl.in");
        mailMessage.IsBodyHtml = true;
        mailMessage.From = new MailAddress("noreply.idf@mea.gov.in");
        Attachment data = new Attachment("http://www.idfoi.nic.in/attachment.pdf", MediaTypeNames.Application.Octet);
        mailMessage.Subject = "IDFOI Sucessfull Registration";
        String full_new_name = first_name.Text + " " + surname.Text;
        mailMessage.Body = "Dear "+full_new_name+",<br><br>Thank you for registering with India Development Foundation of Overseas Indians (IDF-OI).<br><br>IDF-OI, a not-for-profit Trust is set up by the Government to enable philanthropy/ contributions from NRIs/PIOs to social and developmental projects in India. IDF-OI is chaired by Hon’ble Minister for External Affairs, Smt. Sushma Swaraj.<br><br>We invite philanthropy/contribution by Overseas Indians to projects related to Swachh Bharat Mission, Clean Ganga Mission and projects in States of India. A vast pool of projects are available in areas of Education, Sanitation, Healthcare, Women’s Empowerment, and Sustainable Livelihood in Rajasthan, Kerala, Karnataka, Punjab, Madhya Pradesh, West Bengal, Chhattisgarh, Uttarakhand, Maharashtra, Bihar, Sikkim, Tamil Nadu, Odisha, and Mizoram. Details of projects (location, unit cost, implementing agency, beneficiaries etc) are at IDF-OI’s website <a href='http://www.idfoi.nic.in'>www.idfoi.nic.in</a>. <br><br>Please select projects of your preference to which you would like to contribute. You can contribute as an individual, or a group of individuals or even through your respective Indian Associations. A snapshot of the projects is attached for your ready reference.<br><br>Contributions can be sent to IDF-OI through a bank transfer to our account:<br><br>India Development Foundation of Overseas Indians<br>State Bank of India<br>Central Secretariat Branch,<br>North Block, New Delhi 110001<br>A/C no. 33819721882<br>IFSC code SBIN0000625<br>MICR 110002014<br><br><b>Kindly note that IDF-OI does not recover any administrative cost from contributions received from Overseas Indians.</b><br><br>In your interactions with the Indian community please inform them about IDF-OI and invite them to connect with us. Please follow IDF-OI on <a href='http://www.facebook.com/idfoi'>www.facebook.com/idfoi</a> and IDF-OI’s twitter handle @GivingtoIndia for regular updates. If you need any further information, please contact us at- <br><br>CEO, IDF-OI ceo.idf@mea.gov.in<br>+91 11 2345678, +91 -11-26881052 <br><br>We look forward to hearing from you.<br><br>Best regards,<br>Team IDF-OI<br><br>India Development Foundation of Overseas Indians<br>Ministry of External Affairs, GoI<br>927, Akbar Bhawan, Chanakyapuri<br>New Delhi-110021<br>Tel:  +91 -11-26881052";
        SmtpClient smtpClient = new SmtpClient("relay.nic.in");
        smtpClient.Send(mailMessage);
    }
}