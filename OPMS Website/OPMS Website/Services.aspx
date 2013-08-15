<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="OPMS_Website.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul>
        <li id="current"><a href="Home.aspx">Home</a></li>
        <li><a href="Branches.aspx">Branch</a></li>
        <li><a href="Support.aspx">Support</a></li>
        <li><a href="About Us.aspx">About Us</a></li>
        <li>
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin/Login.aspx">Login</asp:LinkButton></li>
        <li></li>
    </ul>
    &nbsp; &nbsp; &nbsp; &nbsp;
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
    <a name="TemplateInfo"></a>
    <h1>Services</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
    <asp:Label ID="Label1" runat="server" Text="Service Name: " Font-Bold="True" ForeColor="#3300FF"></asp:Label>
    <asp:Label ID="lblServiceName" runat="server" Text="Label" Font-Bold="True" ForeColor="#FF3300"></asp:Label><br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Description:" Font-Bold="True" ForeColor="#3300FF"></asp:Label>
    
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Literal ID="ltrDescription" runat="server"></asp:Literal><br />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
