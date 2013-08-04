<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="HomeAdmin.aspx.cs" Inherits="OPMS_Website.Admin.admHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li class="current"><a href="HomeAdmin.aspx">HOME</a></li>
            <li><a href="BranchManagement.aspx">BRANCHES</a></li>
            <li><a href="AccountManagement.aspx">USERS</a></li>
            <li><a href="ServiceManagement.aspx">MANAGEMENT</a></li>
            <li><a href="NewsManagement.aspx">NEWS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan menu con--%>
    <div id="panel">
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <%--Phan nay dung cho noi dung--%>
    <div id="box">
        <h3>Home</h3>
        <div class="form">
            <fieldset id="personal" class="form" style="text-align: left;">
                <legend class="legend" style="width: 54px">INFORMATION</legend>
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label3" runat="server"
                        Text="Total Branches:"></asp:Label>
                <asp:Label ID="lblBranch" runat="server"></asp:Label><br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label4" runat="server" Text="Total Account:"></asp:Label>
                <asp:Label ID="lblAccount" runat="server" ForeColor="Maroon"></asp:Label>
                &nbsp; &nbsp; &nbsp; 
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                &nbsp;
                    <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label5" runat="server" Text="Total Services:"></asp:Label>
                <asp:Label ID="lblService" runat="server" ForeColor="Olive"></asp:Label><br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label6" runat="server" Text="Total Feed back:"></asp:Label>
                <asp:Label ID="lblFeedBack" runat="server" ForeColor="#FF8000"></asp:Label><br />
                <br />
                <br />
                <br />

            </fieldset>
        </div>
    </div>
</asp:Content>

