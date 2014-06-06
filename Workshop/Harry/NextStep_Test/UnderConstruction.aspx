<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UnderConstruction.aspx.cs" Inherits="UnderConstruction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html {
            height: 90%;
        }
        body {
            min-height: 100%;
            background-color: black;
        }
        .under_construction {
            width: 400px;
            height: 100%;
            margin: 20px auto;
        }
            .under_construction img {
                display: block;
                margin: 20px auto;
                vertical-align: middle;
            }
            .under_construction p {
                /*color: white;*/
                font-size: 3em;
                text-align: center;
                text-shadow: 0 0 5px #FFFFA0, 0 0 10px #FFFF4D, 0 0 15px #FFFF41, 0 0 20px #FFFF2A, 0 0 25px #FFFF2B, 0 0 30px #FEFE00, 0 0 35px #F7F700;
            }
    </style>
    <%--<link href="StyleSheets/style.css" rel="stylesheet" type="text/css" />--%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="under_construction">

            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/under_construction.png" />
            <p>Under Construction</p>

        </div>
    </form>
</body>
</html>
