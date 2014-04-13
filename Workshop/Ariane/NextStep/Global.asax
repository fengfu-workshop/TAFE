<%@ Application Language="C#" %>

<script runat="server">
        
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        if (GlobalVar.ValidCards == null) GlobalVar.ValidCards = new CardList();
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown
        GlobalVar.ValidCards.ClearCards();
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
        
        //GlobalVar.Cart = new ShoppingCart();
        Session["Cart"] = new ShoppingCart();

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

        // GlobalVar.Cart.ClearProducts();
        
        ShoppingCart cart = (ShoppingCart)Session["Cart"];
        cart.ClearProducts();     
    }
       
</script>
