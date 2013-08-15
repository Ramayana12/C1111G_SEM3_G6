<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OPMS_Website.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login Form</title>
    <link href="css/CSS/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div id="topPan">
</div>
<!--TopPan Close-->
<!--BodyPan-->
<div id="bodyPan">
	<h1><span>Welcome adminstrator</span></h1>
	<form method="post" runat="server" id="Form1">
		<h2>
            Member login</h2>
        <asp:TextBox ID="txtUserName" runat="server" CssClass="paddingtop"></asp:TextBox><br />
		<asp:TextBox ID="txtPassword" runat="server" TextMode="Password">password</asp:TextBox><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button" OnClick="btnLogin_Click"/></form>
    <br />
    <asp:Label ID="lblStatusLogin" runat="server" ForeColor="Red"></asp:Label></div>
    <div id="bodybottomPan" style="left: 0px; top: 0px">&nbsp;</div>
</body>
</html>
