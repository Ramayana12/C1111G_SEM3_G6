<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OPMS_Website.Home" %>

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

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
    <a name="TemplateInfo">
        <h1>Home</h1>
    </a>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Image ID="Image1" runat="server" Height="254px" ImageUrl="~/CSS/images/home.jpg"
        Width="553px" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <br />
    &nbsp; &nbsp;&nbsp;
    <asp:Image ID="Image2" runat="server" Height="83px" ImageUrl="~/CSS/images/post office.jpeg"
        Width="170px" />&nbsp; &nbsp;<asp:Image ID="Image3" runat="server" Height="83px"
            ImageUrl="~/CSS/images/images.jpeg" Width="170px" />&nbsp;
    <asp:Image ID="Image4" runat="server" Height="83px" ImageUrl="~/CSS/images/sl-4.jpg"
        Width="170px" /><br />
    <p class="post-footer align-right">
        &nbsp;<em>
        Head Office: No.1 Dinh Tien Hoang, Hoan Kiem, Ha Noi, Vietnam</em>
    </p>
    &nbsp; &nbsp;&nbsp;  
</asp:Content>
