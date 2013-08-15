<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.Master" AutoEventWireup="true" CodeBehind="CheckStatus.aspx.cs" Inherits="OPMS_Website.CheckStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li id="current"><a href="Home.aspx">Home</a></li>
        <li><a href="Branches.aspx">Branch</a></li>
        <li><a href="Support.aspx">Support</a></li>
        <li><a href="About Us.aspx">About Us</a></li>
        <li>
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin/Login.aspx">Login</asp:LinkButton></li>
    </ul>
    &nbsp; &nbsp; &nbsp; &nbsp;
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <a name="TemplateInfo"></a>
    <h1>Check the status of the Delivery</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    &nbsp;&nbsp; 
    <br />
    &nbsp;&nbsp;<span style="font-size: 11pt"> &nbsp; &nbsp;&nbsp; <span style="color: #3300cc">ORDER INFROMATION
        AND THE STATUS OF THE DELIVERY<br />
        <br />
        <br />
        &nbsp; &nbsp; &nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Order Number:" Font-Size="9pt" ForeColor="#333399"></asp:Label>&nbsp;
    <asp:Label ID="lblOrderID" runat="server" Font-Size="11pt"></asp:Label><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label2" runat="server" Text="The Status:" Font-Size="9pt" ForeColor="#333399"></asp:Label>&nbsp;
    <asp:Label ID="lblStatus" runat="server" Font-Bold="True" ForeColor="#FF3300" Font-Size="14pt" Font-Italic="True"></asp:Label>
        <br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp;
    <asp:Label ID="Label3" runat="server" Text="Sender Name:" Font-Size="9pt" ForeColor="#333399"></asp:Label>&nbsp;
    <asp:Label ID="lblSenderName" runat="server" Font-Size="11pt"></asp:Label><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <asp:Label ID="Label4" runat="server" Text="Send Date:" Font-Size="9pt" ForeColor="#333399"></asp:Label>&nbsp;
    <asp:Label ID="lblSendDate" runat="server" Font-Size="11pt"></asp:Label>&nbsp;<br />
        <br />
        &nbsp; &nbsp; &nbsp;&nbsp;
    <asp:Label ID="Label5" runat="server" Text="Receiver Name:" Font-Size="9pt" ForeColor="#333399"></asp:Label>&nbsp;
    <asp:Label ID="lblReceiverName" runat="server" Font-Size="11pt"></asp:Label><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    <asp:Label ID="receiverDate" runat="server" Text="Update Date:" Font-Size="9pt" ForeColor="#333399"></asp:Label>&nbsp;
    <asp:Label ID="lblReceivedDate" runat="server" Font-Size="11pt"></asp:Label><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label6" runat="server" Text="Service:" Font-Size="9pt" ForeColor="#333399"></asp:Label>&nbsp; <asp:Label ID="lblService" runat="server" Font-Size="11pt"></asp:Label><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label8" runat="server" Text="Distance:" Font-Size="9pt" ForeColor="#333399"></asp:Label>&nbsp;
    <asp:Label ID="lblDistance" runat="server" Font-Size="11pt"></asp:Label><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <asp:Label ID="Label7" runat="server" Text="Weight:" Font-Size="9pt" ForeColor="#333399"></asp:Label>&nbsp;
    <asp:Label ID="lblWeight" runat="server" Font-Size="11pt"></asp:Label><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label9" runat="server" Text="Note:" Font-Size="9pt" ForeColor="#333399"></asp:Label>&nbsp;
    <asp:Literal ID="ltrNote" runat="server"></asp:Literal><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label10" runat="server" Text="Total Fee:" Font-Size="9pt" ForeColor="#333399"></asp:Label>&nbsp;
    <asp:Label ID="lblTotalFee" runat="server" Font-Size="11pt" ForeColor="#FF3300"></asp:Label>
        <br />
    </span>
        <br />
    </span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp;&nbsp;<span
        style="font-size: 11pt"> </span>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
