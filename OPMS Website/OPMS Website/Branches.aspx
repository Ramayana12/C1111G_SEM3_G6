<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.Master" AutoEventWireup="true" CodeBehind="Branches.aspx.cs" Inherits="OPMS_Website.Branches" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
        <li id="current"><a href="Branches.aspx">Branch</a></li>
        <li><a href="Support.aspx">Support</a></li>
        <li><a href="About Us.aspx">About Us</a></li>
        <li>
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin/Login.aspx">Login</asp:LinkButton></li>
        <li></li>
    </ul>
    &nbsp; &nbsp; &nbsp; &nbsp;
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <a name="TemplateInfo">
        <h1>Branch</h1>
    </a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Image ID="Image1" runat="server" Height="254px" ImageUrl="~/CSS/images/branch.jpg"
        Width="553px" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="This is All Branch:" Font-Bold="True" ForeColor="#3300FF"></asp:Label>
    &nbsp;&nbsp;<br />
    &nbsp; &nbsp;&nbsp;
    <hr style="width: 550px; color: Red;" />
    <br />

    <asp:DataList ID="dtlBranch" runat="server" Width="553px">
        <ItemTemplate>
            <asp:Label ID="Label4" runat="server" Text="Branch Name:" ForeColor="#3300FF" Font-Size="1.1em"></asp:Label>
            <asp:LinkButton ID="lbtnBranch" runat="server" CommandArgument='<%# Eval("ID") %>'
                Text='<%# Eval("Name") %>' Font-Bold="True" ForeColor="#FF3300" ToolTip="Click here view details the branch"></asp:LinkButton><br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Branch Code:" ForeColor="#3300FF" Font-Size="1.1em"></asp:Label>
            <asp:Label ID="_lblBranchName" runat="server" Text='<%# Eval("Email") %>' ForeColor="#009999" Font-Bold="True"></asp:Label><br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Address:" ForeColor="#3300FF" Font-Size="1.1em"></asp:Label>
            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Address") %>' Font-Size="1.1em"></asp:Label><br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="Phone Number:" ForeColor="#3300FF" Font-Size="1.1em"></asp:Label>
            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Phone") %>' Font-Bold="True"></asp:Label>&nbsp;<br />
            <br />
            <hr />
            <br />
        </ItemTemplate>
    </asp:DataList><br />
</asp:Content>
