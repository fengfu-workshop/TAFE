<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="header.ascx" tagname="header" tagprefix="uc1" %>

<%@ Register src="Footer.ascx" tagname="Footer" tagprefix="uc2" %>
<%@ Register src="Login.ascx" tagname="Login" tagprefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:header ID="header1" runat="server" Title="Sydney"/> 
               
    
    </div>
        <h1>This is a heading</h1>
        <p>
            and a paragraph</p>
        <uc3:Login ID="Login1" runat="server" />
        <uc2:Footer ID="Footer1" runat="server" />
    </form>
</body>
</html>
