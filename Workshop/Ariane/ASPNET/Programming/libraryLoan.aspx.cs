using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class libraryLoan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime datCheckOut;
        DateTime datDue;

        datCheckOut = DateTime.Now;
        datDue = FindDueDate(datCheckOut);

        lblToday.Text = datCheckOut.ToShortDateString();
        lblDue.Text = datDue.ToShortDateString();
    }

    private DateTime FindDueDate(DateTime datOut)
    {
        DateTime datIn;

        datIn = datOut.AddDays(14);

        return datIn;
    }
}