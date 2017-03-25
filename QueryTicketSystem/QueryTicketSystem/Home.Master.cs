using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QueryTicketSystem
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblWelcome.Text = "Welcome " + Convert.ToString(Session["CurrentUser"]) + " !";
                ChangeMenuOnRole();
            }
        }
        private void ChangeMenuOnRole()
        {
            string strRole = Convert.ToString(Session["Role"]);
            
                MenuItemCollection menuItems = MainMenu.Items;
                MenuItem adminItem = new MenuItem();
                MenuItem studItem = new MenuItem();
                foreach (MenuItem menuItem in menuItems)
                {
                    if ((menuItem.Text.Trim() == "Create Instructor") && (strRole.ToUpper() != "ADMIN"))
                    {
                        adminItem = menuItem;
                    }

                    if (strRole.ToUpper() == "ADMIN")
                    {
                        if (menuItem.Text.Trim() == "My Tickets")
                        {
                            studItem = menuItem;
                        }
                        else if (menuItem.Text.Trim() == "Tickets")
                        {
                            menuItem.NavigateUrl = "~/AdminHome.aspx";
                        }
                    }
                    if (strRole.ToUpper() == "INSTRUCTOR")
                    {
                        if (menuItem.Text.Trim() == "My Tickets")
                        {
                            studItem = menuItem;
                        }
                        else if (menuItem.Text.Trim() == "Tickets")
                        {
                            menuItem.NavigateUrl = "~/InstructorHome.aspx";
                        }
                    }
                    if (strRole.ToUpper() == "STUDENT")
                    {
                        if (menuItem.Text.Trim() == "Tickets")
                        {
                            menuItem.NavigateUrl = "~/StudentAllTics.aspx";
                        }
                    }
                    //if ((menuItem.Text.Trim() == "Query Ticket") && (strRole == "Admin"))
                    //{
                    //    menuItem.NavigateUrl = "~/AdminHome.aspx";
                    //}
                    //else if ((menuItem.Text.Trim() == "Query Ticket") && (strRole == "Instructor"))
                    //{
                    //    menuItem.NavigateUrl = "~/InstructorHome.aspx";
                    //}
                    //else if ((menuItem.Text.Trim() == "Query Ticket") && (strRole == "Student"))
                    //{
                    //    menuItem.NavigateUrl = "~/StudentHome.aspx";
                    //}
                    
                }
                menuItems.Remove(adminItem);
                menuItems.Remove(studItem);            
        }
    }
}