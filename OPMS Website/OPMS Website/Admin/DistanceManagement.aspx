﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="DistanceManagement.aspx.cs" Inherits="OPMS_Website.Admin.DistanceManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="HomeAdmin.aspx">HOME</a></li>
            <li><a href="BranchManagement.aspx">BRANCHES</a></li>
            <li><a href="AccountManagement.aspx">EMPLOYEE</a></li>
            <li class="current"><a href="ServiceManagement.aspx">MANAGEMENT</a></li>
            <li><a href="NewsManagement.aspx">NEWS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan menu con--%>
    <div id="panel">
        <ul id="ulMenu" runat="server">
            <li><a href="ServiceManagement.aspx" class="service">Services</a></li>
            <li><a href="DistanceManagement.aspx" class="distance">Distances</a></li>
            <li><a href="WeightManagement.aspx" class="cart">Weights</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <%--Phan nay dung cho noi dung--%>
    <div id="box">
        <h3>Distance charge Management</h3>
        <div id="Div1" class="form" runat="server">
            <fieldset id="personal" class="form" style="text-align: left">
                <legend class="legend">INFORMATION</legend>&nbsp;&nbsp;
        <asp:LinkButton ID="lbtnCreateNewService" runat="server" Width="113px" PostBackUrl="~/Admin/DistanceCreate.aspx">Create new Distance charge</asp:LinkButton>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Label ID="Lable1" runat="server" Text="Total services: " Width="83px" ForeColor="#0000FF"></asp:Label><asp:Label
            ID="lblTotalService" runat="server"></asp:Label><br />
                <br />
                <asp:GridView ID="gvDistance" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    PageSize="15" OnPageIndexChanging="gvDistance_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Distance Charge name" />
                        <asp:TemplateField HeaderText="Charge">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDecimal(Eval("Charge")).ToString("c2") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
<%--                                <asp:LinkButton ID="lbtnRemove" runat="server" ToolTip="Delete Distance charge" CommandArgument='<%# Eval("ID") %>' OnCommand="lbtnRemove_Command" OnClientClick="return confirm('Are you sure you want to delete this record ?')">Remove</asp:LinkButton>&nbsp;--%>
                        &nbsp;&nbsp;<asp:LinkButton ID="lbtnUpdate" ToolTip="Update Distance charge" runat="server" CommandArgument='<%# Eval("ID") %>' OnCommand="lbtnUpdate_Command">Update</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <br />
            </fieldset>
        </div>
    </div>
</asp:Content>
