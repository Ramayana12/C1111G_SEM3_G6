<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/MasterPageHome.Master" AutoEventWireup="true" CodeBehind="Support.aspx.cs" Inherits="OPMS_Website.Support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="Branches.aspx">Branch</a></li>
        <li id="current"><a href="Support.aspx">Support</a></li>
        <li><a href="About Us.aspx">About Us</a></li>
        <li>
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin/Login.aspx">Login</asp:LinkButton></li>
        <li></li>
    </ul>
    &nbsp; &nbsp; &nbsp; &nbsp;
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
    <a name="TemplateInfo">
        <h1>Support</h1>
    </a>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/CSS/images/online.jpg" /><br />
    &nbsp; &nbsp; &nbsp; <span style="color: #ff3300">Hotline</span>: +84.123.456.789<br />
    <span title="M&#7885;i th&#7855;c m&#7855;c xin g&#7917;i v&#7873; hòm th&#432;: support@tars.com">&nbsp; &nbsp;
        &nbsp; Any questions should be sent to mailbox: <span style="color: #339900">support@tars.com</span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <br />
    &nbsp; &nbsp; &nbsp;&nbsp;
   We would like to receive the contributions of you, we will answer any questions your related services to us.

    <br />
    <br />
    &nbsp; &nbsp; &nbsp;&nbsp;
   Please fill out and submit questions to us.&nbsp;<br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Full name: "></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFullName" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ControlToValidate="txtFullName" ForeColor="Red"></asp:RequiredFieldValidator></td>
            <td></td>
        </tr>       
        <tr>
            <td style="text-align: right">
                <asp:Label ID="Label2" runat="server" Text="Email: "></asp:Label></td>
            <td style="width: 407px">
                <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email format not Valid!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
            <td style="width: 1px"></td>
        </tr>
        <tr>
            <td valign="top" style="text-align: right; height: 125px;">
                <asp:Label ID="Label3" runat="server" Text="Content: "></asp:Label></td>
            <td style="width: 407px; height: 125px;">
                <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required!" ForeColor="Red" ControlToValidate="txtContent"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 1px; height: 125px;"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Label ID="lblReport" runat="server" ForeColor="Red"></asp:Label></td>
            <td style="width: 1px"></td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: left">
                <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" /></td>
            <td style="width: 1px"></td>
        </tr>
    </table>
    <br />
    <br />
    <span id="result_box" class="short_text"><span title="Hot line: 0985.609.018">&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; </span></span>
    &nbsp;
    &nbsp; &nbsp;&nbsp;
    <br />
    <br />
</asp:Content>
