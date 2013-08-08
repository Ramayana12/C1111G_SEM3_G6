<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.Master" AutoEventWireup="true" CodeBehind="Newss.aspx.cs" Inherits="OPMS_Website.Newss" %>
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
    <a title="TemplateInfo"></a>
    <h1>News</h1>
    <br />
    <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.2em" ForeColor="Navy"></asp:Label><br />
    <br />
        <asp:Label ID="lblCreateDate" runat="server" Font-Italic="True"></asp:Label><br />
    <br />
    <b><asp:Literal ID="ltrSubject" runat="server"></asp:Literal></b><br />
    <br />
    <asp:Literal ID="ltrContent" runat="server"></asp:Literal><br />
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
