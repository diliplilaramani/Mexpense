<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MSO.Web.View.Login" %>



<%@ Register Assembly="MSO.Controls" Namespace="MSO.Controls" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
        <tr>
        <td>
            <asp:Label ID="lblUsername" Text ="User Name" runat ="server" ></asp:Label>
        </td>
        <td>
            <cc1:MSOTextbox ID="txtUserName" runat="server"></cc1:MSOTextbox>
        </td>
        <td>
            <cc
        </td>
        </tr>

       <tr>
        <td>
            <asp:Label ID="lblPassword" runat="server" Text ="Password" ></asp:Label>
        </td>
        <td>
            <cc1:MSOTextbox ID="txtPassword" runat="server"></cc1:MSOTextbox>
        </td>

        </tr>

        <tr>
        <td>
            <asp:Label ID="lblCompany" runat="server" Text ="Organization" ></asp:Label>
        </td>
        <td>
           
        </td>

        </tr>
        <tr>
        <td>
        </td>
            <td  align="right" > 
                <cc1:MSOLinkButton id = "btnLogin" runat ="server" BorderStyle="Outset" 
                    onclick="btnLogin_Click" Text ="Login" ></cc1:MSOLinkButton>
            </td>
        </tr>
        </table>
    </div>
    
    </form>
</body>
</html>
