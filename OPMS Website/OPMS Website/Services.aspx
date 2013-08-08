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
    <a name="TemplateInfo">
        <h1>Services</h1>
    </a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
